fx_version 'cerulean'
game 'gta5'

name 'oxe_business'
description 'Modular business system for FiveM (OXE)'
version '0.1.0'
author 'OXE'

lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    'shared/constants.lua',
    'shared/config.lua',
    'shared/schema.lua'
}

client_scripts {
    'framework/qbx/client.lua',
    'framework/qb/client.lua',
    'framework/esx/client.lua',
    'framework/ox/client.lua',
    'framework/init.lua',
    'client/main.lua',
    'client/ui.lua'
}

server_scripts {
    'framework/qbx/server.lua',
    'framework/qb/server.lua',
    'framework/esx/server.lua',
    'framework/ox/server.lua',
    'framework/init.lua',
    'server/database.lua',
    'server/main.lua'
}

files {
    'locales/*.json'
}
