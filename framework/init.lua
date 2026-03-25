--[[
    oxe_business - Framework bootstrap

    Este archivo:
    - detecta el framework activo
    - expone metadatos comunes
    - selecciona el adapter correcto ya cargado por fxmanifest

    NO:
    - carga archivos manualmente
    - implementa lógica de negocio
    - contiene wrappers complejos todavía
]]

OxeFramework = OxeFramework or {}
OxeFramework.adapters = OxeFramework.adapters or {}
OxeFramework.api = OxeFramework.api or {}

local IS_SERVER = IsDuplicityVersion()

local DETECTION_ORDER = {
    { name = 'qbx', resource = 'qbx_core' },
    { name = 'qb', resource = 'qb-core' },
    { name = 'esx', resource = 'es_extended' },
    { name = 'ox', resource = 'ox_core' }
}

local function isStarted(resourceName)
    return type(resourceName) == 'string' and GetResourceState(resourceName) == 'started'
end

local function detectFramework()
    for i = 1, #DETECTION_ORDER do
        local entry = DETECTION_ORDER[i]
        if isStarted(entry.resource) then
            return entry.name, entry.resource
        end
    end

    return nil, nil
end

local function debugWarn(message)
    if Config and Config.Debug then
        print(('[oxe_business] WARNING: %s'):format(message))
    end
end

local frameworkName, frameworkResource = detectFramework()
local side = IS_SERVER and 'server' or 'client'

OxeFramework.name = frameworkName
OxeFramework.resource = frameworkResource
OxeFramework.side = side

local function createSafeApi()
    return {
        framework = frameworkName or 'none',
        side = side,
        isFallback = true,

        GetPlayerData = function(...)
            return nil
        end,

        GetJob = function(...)
            return nil
        end,

        HasItem = function(...)
            return false
        end,

        Notify = function(...)
            return false
        end
    }
end

local function normalizeApi(api)
    local safe = createSafeApi()

    if type(api) ~= 'table' then
        return safe
    end

    -- Asegurar API uniforme con fallback seguro.
    api.framework = api.framework or safe.framework
    api.side = api.side or safe.side
    api.isFallback = api.isFallback or false

    api.GetPlayerData = type(api.GetPlayerData) == 'function' and api.GetPlayerData or safe.GetPlayerData
    api.GetJob = type(api.GetJob) == 'function' and api.GetJob or safe.GetJob
    api.HasItem = type(api.HasItem) == 'function' and api.HasItem or safe.HasItem
    api.Notify = type(api.Notify) == 'function' and api.Notify or safe.Notify

    return api
end

if not frameworkName then
    debugWarn('No framework detected. Using safe fallback API.')
    OxeFramework.api = normalizeApi(nil)
else
    local adapterGroup = OxeFramework.adapters[frameworkName]

    if adapterGroup and type(adapterGroup[side]) == 'table' then
        OxeFramework.api = normalizeApi(adapterGroup[side])
    else
        debugWarn(('Framework "%s" detected but no %s adapter was registered. Using safe fallback API.'):format(frameworkName, side))
        OxeFramework.api = normalizeApi(nil)
    end
end
