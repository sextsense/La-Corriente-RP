resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Online Job HUD'

version '1.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server.lua',
	'config.lua'
}

client_scripts {
	'client.lua',
	'config.lua'
}

ui_page 'html/scoreboard.html'

files {
	'html/scoreboard.html',
	'html/style.css',
	'html/listener.js',
}