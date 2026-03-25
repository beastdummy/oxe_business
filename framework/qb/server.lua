--[[
    QB (qb-core) - Server Adapter (Skeleton)

    Propósito:
    - Punto de integración para funciones servidor específicas de qb-core.
    - Este archivo debe retornar una tabla (API) consumida por `framework/init.lua`.

    Notas:
    - Sin lógica de negocio aún.
    - Aquí luego agregaremos wrappers para inventario, jobs, money, etc.
]]

local api = {
    framework = 'qb',
    side = 'server',
}

-- Stubs (se implementarán en fases posteriores)
function api.GetPlayerData(_source)
    error('[OXE] GetPlayerData (QB server) aún no implementado')
end

function api.GetJob(_source)
    error('[OXE] GetJob (QB server) aún no implementado')
end

function api.HasItem(_source, _itemName, _amount)
    error('[OXE] HasItem (QB server) aún no implementado')
end

function api.Notify(_source, _msg, _type)
    error('[OXE] Notify (QB server) aún no implementado')
end

return api

