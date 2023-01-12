If (Application type:C494=4D Remote mode:K5:5)
	
	REGISTER CLIENT:C648(Current machine:C483)
	
	For each ($webIPAddressToListen; serverInfo.options.webIPAddressToListen)
		
		Case of 
			: (Match regex:C1019("(?:[:Hex_Digit:]+\\.){3}[:Hex_Digit:]+"; $webIPAddressToListen))
				
				OPEN URL:C673($webIPAddressToListen)
				
			Else 
				
				//IPv6
				
		End case 
		
	End for each 
	
End if 