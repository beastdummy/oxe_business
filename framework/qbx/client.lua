--[[
    QBX (qbx_core) - Client Adapter (Skeleton)

    Propósito:
    - Punto de integración para funciones cliente específicas de QBX.
    - Este archivo debe retornar una tabla (API) consumida por `framework/init.lua`.

    Notas:
    - Sin lógica de negocio aún.
    - Aquí NO se registran eventos, ni threads, ni exports (por ahora).
]]

local api = {
    framework = 'qbx',
    side = 'client',
}

-- Stubs (se implementarán en fases posteriores)
function api.GetPlayerData()
    error('[OXE] GetPlayerData (QBX client) aún no implementado')
end

function api.GetJob()
    error('[OXE] GetJob (QBX client) aún no implementado')
end

function api.Notify(_msg, _type)
    error('[OXE] Notify (QBX client) aún no implementado')
end

function api.HasItem(_itemName, _amount)
    error('[OXE] HasItem (QBX client) aún no implementado')
end

return api

