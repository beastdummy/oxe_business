--[[
    QB (qb-core) - Server Adapter (Skeleton)

    Propósito:
    - Punto de integración para funciones servidor específicas de qb-core.
    - Este archivo registra un adapter en `OxeFramework.adapters`.

    Notas:
    - Sin lógica de negocio aún.
    - Aquí luego agregaremos wrappers para inventario, jobs, money, etc.
]]

OxeFramework = OxeFramework or {}
OxeFramework.adapters = OxeFramework.adapters or {}
OxeFramework.adapters.qb = OxeFramework.adapters.qb or {}

OxeFramework.adapters.qb.server = {
    framework = 'qb',
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

