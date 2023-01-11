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