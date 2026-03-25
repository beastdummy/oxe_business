--[[
    OX (ox_core) - Server Adapter (Skeleton)

    Propósito:
    - Punto de integración para funciones servidor específicas de ox_core.
    - Este archivo debe retornar una tabla (API) consumida por `framework/init.lua`.

    Notas:
    - Sin lógica de negocio aún.
    - En fases siguientes, aquí se mapearán inventario, grupos, permisos, etc.
]]

local api = {
    framework = 'ox',
    side = 'server',
}

-- Stubs (se implementarán en fases posteriores)
function api.GetPlayerData(_source)
    error('[OXE] GetPlayerData (OX server) aún no implementado')
end

function api.GetJob(_source)
    error('[OXE] GetJob (OX server) aún no implementado')
end

function api.HasItem(_source, _itemName, _amount)
    error('[OXE] HasItem (OX server) aún no implementado')
end

function api.Notify(_source, _msg, _type)
    error('[OXE] Notify (OX server) aún no implementado')
end

return api

