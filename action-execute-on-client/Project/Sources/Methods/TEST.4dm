//%attributes = {"invisible":true,"publishedWeb":true,"preemptive":"capable"}
#DECLARE($message : Text)

$arguments:=Split string:C1554($message; "/").slice(1)

For each ($argument; $arguments)
	EXECUTE ON CLIENT:C651("@"; "API"; $argument)
End for each 

WEB SEND TEXT:C677("EXECUTE ON CLIENTを実行しました"; "text/plain")