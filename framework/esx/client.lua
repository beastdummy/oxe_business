--[[
    ESX (es_extended) - Client Adapter (Skeleton)

    Propósito:
    - Punto de integración para funciones cliente específicas de ESX.
    - Este archivo registra un adapter en `OxeFramework.adapters`.

    Notas:
    - Sin lógica de negocio aún.
    - En fases siguientes, aquí se mapeará la obtención de playerData y notificaciones.
]]

OxeFramework = OxeFramework or {}
OxeFramework.adapters = OxeFramework.adapters or {}
OxeFramework.adapters.esx = OxeFramework.adapters.esx or {}

OxeFramework.adapters.esx.client = {
    framework = 'esx',
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

