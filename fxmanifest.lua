fx_version 'cerulean'
game 'gta5'

name 'oxe_business'
description 'Modular business system for FiveM (OXE)'
version '0.1.0'
author 'OXE'

lua54 'yes'

-- Shared
shared_scripts {
    '@ox_lib/init.lua', -- opcional pero recomendado si lo vas a usar
    'shared/constants.lua',
    'shared/config.lua',
    'shared/schema.lua'
}

-- Client
client_scripts {
    'client/main.lua',
    'client/ui.lua'
}

-- Server
server_scripts {
    'server/database.lua',
    'server/main.lua'
}

-- Locales (traducciones)
files {
    'locales/*.json'
}

-- Export opcional (lo usaremos más adelante)
-- exports {}
-- server_exports {}
