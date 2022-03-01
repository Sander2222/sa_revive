fx_version 'cerulean'
games { 'gta5' }
author 'Sander#2211'
description 'Revive station with UI'

client_scripts {
    'client.lua',
    'config.lua'
}

server_scripts {
    'server.lua',
    'config.lua'
}

ui_page ('ui/ui.html')

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