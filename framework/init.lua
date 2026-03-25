--[[
    OXE Business - Framework Loader

    Propósito:
    - Detectar el framework activo (QBX / QB / ESX / OX) de forma simple y estable.
    - Cargar el módulo correspondiente (client.lua o server.lua) sin usar `require`,
      usando un patrón compatible con FiveM: LoadResourceFile + load().

    Importante:
    - Este archivo NO implementa lógica de negocio.
    - Solo resuelve "qué framework está activo" y expone un API consistente.

    Reglas de arquitectura (OXE):
    - Los adapters viven en `framework/<fw>/{client,server}.lua`.
    - Cada adapter debe RETORNAR una tabla `api` (sin registrar lógica avanzada aún).
    - Este archivo debe ser fácil de leer y mantener: sin magia y sin sobreingeniería.
]]

OXE = OXE or {}

local CURRENT_RESOURCE = GetCurrentResourceName()
local IS_SERVER = IsDuplicityVersion()

local function isResourceStarted(resourceName)
    if type(resourceName) ~= 'string' or resourceName == '' then return false end
    return GetResourceState(resourceName) == 'started'
end

-- Orden de detección. Si hay más de uno iniciado, gana el primero.
local DETECTION_ORDER = {
    { name = 'qbx', resource = 'qbx_core' },
    { name = 'qb',  resource = 'qb-core' },
    { name = 'esx', resource = 'es_extended' },
    { name = 'ox',  resource = 'ox_core' },
}

local function detectFramework()
    for _, fw in ipairs(DETECTION_ORDER) do
        if isResourceStarted(fw.resource) then
            return fw.name, fw.resource
        end
    end
    return nil, nil
end

local function debugEnabled()
    return type(Config) == 'table' and Config.Debug == true
end

local function debugWarn(msg)
    if not debugEnabled() then return end
    print(('[OXE] ^3WARNING^7 %s'):format(msg))
end

local function loadFrameworkModule(frameworkName)
    local side = IS_SERVER and 'server' or 'client'
    local relativePath = ('framework/%s/%s.lua'):format(frameworkName, side)
    local source = LoadResourceFile(CURRENT_RESOURCE, relativePath)

    if not source or source == '' then return nil, ('no_file:%s'):format(relativePath) end

    -- Entorno aislado (pero con fallback a _G) para evitar fugas accidentales.
    local env = setmetatable({
        OXE = OXE,
        exports = exports,
    }, { __index = _G })

    local chunk, err = load(source, ('@@%s/%s'):format(CURRENT_RESOURCE, relativePath), 't', env)
    if not chunk then return nil, ('compile_error:%s:%s'):format(relativePath, err or 'unknown') end

    local ok, result = pcall(chunk)
    if not ok then return nil, ('runtime_error:%s:%s'):format(relativePath, result or 'unknown') end

    -- Convención: el módulo devuelve una tabla con el API del framework.
    if type(result) ~= 'table' then return nil, ('bad_return:%s'):format(relativePath) end

    return result, nil
end

local fwName, fwResource = detectFramework()

local function createSafeApi(selectedFrameworkName)
    local api = {
        framework = selectedFrameworkName or 'none',
        side = IS_SERVER and 'server' or 'client',
        isStub = true,
    }

    local function notReady(fnName)
        return function()
            error(('[OXE] Framework API "%s" no está disponible (framework=%s, side=%s).'):format(
                fnName,
                api.framework,
                api.side
            ))
        end
    end

    -- Stubs base para crecer en el futuro (sin lógica avanzada por ahora).
    api.GetPlayerData = notReady('GetPlayerData')
    api.HasItem = notReady('HasItem')
    api.Notify = notReady('Notify')
    api.GetJob = notReady('GetJob')

    return api
end

OXE.Framework = {
    -- Nombre del módulo seleccionado: 'qbx' | 'qb' | 'esx' | 'ox' | nil
    name = fwName,
    -- Nombre del resource detectado: 'qbx_core' | 'qb-core' | 'es_extended' | 'ox_core' | nil
    resource = fwResource,
    -- Side actual
    side = IS_SERVER and 'server' or 'client',
    -- API del framework (tabla retornada por el módulo)
    api = nil,
}

if fwName then
    local api, loadErr = loadFrameworkModule(fwName)
    if api then
        OXE.Framework.api = api
    else
        debugWarn(('Adapter no pudo cargarse (%s). Se usará API segura (stubs).'):format(loadErr or 'unknown'))
        OXE.Framework.api = createSafeApi(fwName)
    end
else
    -- Sin framework detectado: dejamos un API vacío para no romper el resource.
    -- Más adelante podemos decidir: error hard, fallback, o modo standalone.
    debugWarn('No se detectó framework (qbx_core/qb-core/es_extended/ox_core). Se usará API segura (stubs).')
    OXE.Framework.api = createSafeApi(nil)
end

