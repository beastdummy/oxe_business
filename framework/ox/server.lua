--[[
    OX (ox_core) - Server Adapter (Skeleton)

    Propósito:
    - Punto de integración para funciones servidor específicas de ox_core.
    - Este archivo registra un adapter en `OxeFramework.adapters`.

    Notas:
    - Sin lógica de negocio aún.
    - En fases siguientes, aquí se mapearán inventario, grupos, permisos, etc.
]]

OxeFramework = OxeFramework or {}
OxeFramework.adapters = OxeFramework.adapters or {}
OxeFramework.adapters.ox = OxeFramework.adapters.ox or {}

OxeFramework.adapters.ox.server = {
    framework = 'ox',
    side = 'server',

    -- Stubs seguros (se implementarán en fases posteriores)
    GetPlayerData = function(_source, ...)
        return nil
    end,

    GetJob = function(_source, ...)
        return nil
    end,

    HasItem = function(_source, _itemName, _amount)
        return false
    end,

    Notify = function(_source, _msg, _type)
        return false
    end
}

