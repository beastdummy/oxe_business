--[[
    ESX (es_extended) - Server Adapter (Skeleton)

    Propósito:
    - Punto de integración para funciones servidor específicas de ESX.
    - Este archivo debe retornar una tabla (API) consumida por `framework/init.lua`.

    Notas:
    - Sin lógica de negocio aún.
    - En fases siguientes, aquí se mapeará inventario, dinero, jobs, etc.
]]

local api = {
    framework = 'esx',
    side = 'server',
}

-- Stubs (se implementarán en fases posteriores)
function api.GetPlayerData(_source)
    error('[OXE] GetPlayerData (ESX server) aún no implementado')
end

function api.GetJob(_source)
    error('[OXE] GetJob (ESX server) aún no implementado')
end

function api.HasItem(_source, _itemName, _amount)
    error('[OXE] HasItem (ESX server) aún no implementado')
end

function api.Notify(_source, _msg, _type)
    error('[OXE] Notify (ESX server) aún no implementado')
end

return api

