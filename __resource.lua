fx_version 'cerulean'
games { 'gta5' }
author 'Sander#2211'
description 'a keybind UI'

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

shared_script {
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
