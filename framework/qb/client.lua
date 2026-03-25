--[[
    QB (qb-core) - Client Adapter (Skeleton)

    Propósito:
    - Punto de integración para funciones cliente específicas de qb-core.
    - Este archivo registra un adapter en `OxeFramework.adapters`.

    Notas:
    - Sin lógica de negocio aún.
    - Más adelante aquí se mapearán helpers comunes (Notify, GetPlayerData, etc).
]]

OxeFramework = OxeFramework or {}
OxeFramework.adapters = OxeFramework.adapters or {}
OxeFramework.adapters.qb = OxeFramework.adapters.qb or {}

OxeFramework.adapters.qb.client = {
    framework = 'qb',
    side = 'client',

    -- Stubs seguros (se implementarán en fases posteriores)
    GetPlayerData = function(...)
        return nil
    end,

    GetJob = function(...)
        return nil
    end,

    HasItem = function(_itemName, _amount)
        return false
    end,

    Notify = function(_msg, _type)
        return false
    end
}

