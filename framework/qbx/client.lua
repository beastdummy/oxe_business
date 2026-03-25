--[[
    QBX client adapter
    Solo define la API cliente para qbx_core.
    No meter lógica de negocio aquí.
]]

OxeFramework = OxeFramework or {}
OxeFramework.adapters = OxeFramework.adapters or {}
OxeFramework.adapters.qbx = OxeFramework.adapters.qbx or {}

OxeFramework.adapters.qbx.client = {
    framework = 'qbx',
    side = 'client',

    GetPlayerData = function()
        return nil
    end,

    GetJob = function()
        return nil
    end,

    HasItem = function(_itemName, _amount)
        return false
    end,

    Notify = function(_msg, _type)
        return false
    end
}
