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

* [index.html](https://github.com/4D-JP/4d-example-action-execute-on-client/blob/main/action-execute-on-client/Data/HTTP/index.html)

```html
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Cover Template for Bootstrap</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/cover.css" rel="stylesheet">
  </head>
  <body class="text-center">
    <div class="cover-container d-flex h-100 p-3 mx-auto flex-column">
      <header class="masthead mb-auto">
        <div class="inner">
          <h3 class="masthead-brand"></h3>
        </div>
      </header>
      <main role="main" class="inner cover">
        <h1 class="cover-heading"></h1>
        <p class="lead">
          <a id="test" href="#" class="btn btn-lg btn-secondary">/4DACTION/TEST/</a>
        </p>
        <p class="lead" id="message" />
      </main>
      <footer class="mastfoot mt-auto">
        <div class="inner">
        </div>
      </footer>
    </div>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/jquery-3.6.3.min.js"></script>
    <script>
        $(function() {
            $("#test").click(function(e){
                e.preventDefault();
                $.post("/4DACTION/TEST/あ/あ/あ", function(data) {
                  $("#message").html(data);
                });
            });
        });
    </script>
  </body>
</html>
```
