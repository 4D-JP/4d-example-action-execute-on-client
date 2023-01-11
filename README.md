![version](https://img.shields.io/badge/version-19%2B-5682DF)
![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm%20|%20win-64&color=blue)
[![license](https://img.shields.io/github/license/4D-JP/4d-example-action-execute-on-client)](LICENSE)

# 4d-example-action-execute-on-client

* [On Server Startup](https://github.com/4D-JP/4d-example-action-execute-on-client/blob/main/action-execute-on-client/Project/Sources/DatabaseMethods/onServerStartup.4dm)

```4d
ASSERT:C1129(Is license available:C714(4D Web license:K44:3)\
 | Is license available:C714(4D Web local license:K44:14)\
 | Is license available:C714(4D Web one connection license:K44:15))

$server:=WEB Server:C1674(Web server database:K73:30)

If (Not:C34($server.isRunning))
	$settings:=New object:C1471
	$settings.rootFolder:=Folder:C1567(fk data folder:K87:12).folder("HTTP")
	$status:=$server.start($settings)
	ASSERT:C1129($status.success)
End if 
```

* [On Startup](https://github.com/4D-JP/4d-example-action-execute-on-client/blob/main/action-execute-on-client/Project/Sources/DatabaseMethods/onStartup.4dm)

```4d
REGISTER CLIENT:C648("@")

For each ($webIPAddressToListen; serverInfo.options.webIPAddressToListen)
	Case of 
		: (Match regex:C1019("(?:[:Hex_Digit:]+\\.){3}[:Hex_Digit:]+"; $webIPAddressToListen))
			OPEN URL:C673($webIPAddressToListen)
		Else 
			//IPv6	
	End case 
End for each 
```
