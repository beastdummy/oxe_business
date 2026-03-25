--[[
    QB (qb-core) - Client Adapter (Skeleton)

    Propósito:
    - Punto de integración para funciones cliente específicas de qb-core.
    - Este archivo debe retornar una tabla (API) consumida por `framework/init.lua`.

    Notas:
    - Sin lógica de negocio aún.
    - Más adelante aquí se mapearán helpers comunes (Notify, GetPlayerData, etc).
]]

local api = {
    framework = 'qb',
    side = 'client',
}

-- Stubs (se implementarán en fases posteriores)
function api.GetPlayerData()
    error('[OXE] GetPlayerData (QB client) aún no implementado')
end

function api.GetJob()
    error('[OXE] GetJob (QB client) aún no implementado')
end

function api.Notify(_msg, _type)
    error('[OXE] Notify (QB client) aún no implementado')
end

function api.HasItem(_itemName, _amount)
    error('[OXE] HasItem (QB client) aún no implementado')
end

return api

