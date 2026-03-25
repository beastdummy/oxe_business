--[[
    QBX server adapter
    Solo define la API servidor para qbx_core.
    No meter lógica de negocio aquí.
]]

OxeFramework = OxeFramework or {}
OxeFramework.adapters = OxeFramework.adapters or {}
OxeFramework.adapters.qbx = OxeFramework.adapters.qbx or {}

OxeFramework.adapters.qbx.server = {
    framework = 'qbx',
    side = 'server',

    GetPlayerData = function(_source)
        return nil
    end,

    GetJob = function(_source)
        return nil
    end,

    HasItem = function(_source, _itemName, _amount)
        return false
    end,

    Notify = function(_source, _msg, _type)
        return false
    end
}
