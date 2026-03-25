--[[
    OX (ox_core) - Client Adapter (Skeleton)

    Propósito:
    - Punto de integración para funciones cliente específicas de ox_core.
    - Este archivo registra un adapter en `OxeFramework.adapters`.

    Notas:
    - Sin lógica de negocio aún.
    - Pensado para convivir bien con ox_lib (notifies, callbacks, etc) en el futuro.
]]

OxeFramework = OxeFramework or {}
OxeFramework.adapters = OxeFramework.adapters or {}
OxeFramework.adapters.ox = OxeFramework.adapters.ox or {}

OxeFramework.adapters.ox.client = {
    framework = 'ox',
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

