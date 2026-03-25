--[[
    QBX (qbx_core) - Server Adapter (Skeleton)

    Propósito:
    - Punto de integración para funciones servidor específicas de QBX.
    - Este archivo debe retornar una tabla (API) consumida por `framework/init.lua`.

    Notas:
    - Sin lógica de negocio aún.
    - Sin acceso a DB / inventarios / jobs todavía.
]]

local api = {
    framework = 'qbx',
    side = 'server',
}

-- Stubs (se implementarán en fases posteriores)
function api.GetPlayerData(_source)
    error('[OXE] GetPlayerData (QBX server) aún no implementado')
end

function api.GetJob(_source)
    error('[OXE] GetJob (QBX server) aún no implementado')
end

function api.HasItem(_source, _itemName, _amount)
    error('[OXE] HasItem (QBX server) aún no implementado')
end

function api.Notify(_source, _msg, _type)
    error('[OXE] Notify (QBX server) aún no implementado')
end

return api

