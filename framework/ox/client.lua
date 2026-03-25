--[[
    OX (ox_core) - Client Adapter (Skeleton)

    Propósito:
    - Punto de integración para funciones cliente específicas de ox_core.
    - Este archivo debe retornar una tabla (API) consumida por `framework/init.lua`.

    Notas:
    - Sin lógica de negocio aún.
    - Pensado para convivir bien con ox_lib (notifies, callbacks, etc) en el futuro.
]]

local api = {
    framework = 'ox',
    side = 'client',
}

-- Stubs (se implementarán en fases posteriores)
function api.GetPlayerData()
    error('[OXE] GetPlayerData (OX client) aún no implementado')
end

function api.GetJob()
    error('[OXE] GetJob (OX client) aún no implementado')
end

function api.Notify(_msg, _type)
    error('[OXE] Notify (OX client) aún no implementado')
end

function api.HasItem(_itemName, _amount)
    error('[OXE] HasItem (OX client) aún no implementado')
end

return api

