fx_version 'cerulean'
game 'gta5'
dependency "vrp"

ui_page 'html/index.html'

client_scripts {
    "lib/Tunnel.lua",
    "lib/Proxy.lua",
    'config.lua',
    'client/*.lua',
}

server_scripts {
    "lib/Tunnel.lua",
    "lib/Proxy.lua",
    "@vrp/lib/utils.lua",
    'server/main.lua',
}

files {
    'html/*.html',
    'html/css/*.css',
    'html/js/*.js',
}
