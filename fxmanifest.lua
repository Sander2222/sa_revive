fx_version 'cerulean'
games { 'gta5' }
author 'Sander#2211'
description 'Revive Station'
version '2.0'

client_script 'client.lua'
server_scripts {
    'svconfig.lua',
    'server.lua'
}
shared_script 'config.lua'

ui_page 'ui/ui.html'

files {
    'ui/ui.html',
    'ui/style.css',
    'ui/font/LEMONMILK-Regular.otf',
    'ui/app.js'
}

dependencies {
    'esx_ambulancejob',
    'es_extended'
}
