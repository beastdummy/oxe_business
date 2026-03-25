--[[
    ESX (es_extended) - Client Adapter (Skeleton)

    Propósito:
    - Punto de integración para funciones cliente específicas de ESX.
    - Este archivo debe retornar una tabla (API) consumida por `framework/init.lua`.

    Notas:
    - Sin lógica de negocio aún.
    - En fases siguientes, aquí se mapeará la obtención de playerData y notificaciones.
]]

local api = {
    framework = 'esx',
    side = 'client',
}

-- Stubs (se implementarán en fases posteriores)
function api.GetPlayerData()
    error('[OXE] GetPlayerData (ESX client) aún no implementado')
end

function api.GetJob()
    error('[OXE] GetJob (ESX client) aún no implementado')
end

function api.Notify(_msg, _type)
    error('[OXE] Notify (ESX client) aún no implementado')
end

function api.HasItem(_itemName, _amount)
    error('[OXE] HasItem (ESX client) aún no implementado')
end

return api

