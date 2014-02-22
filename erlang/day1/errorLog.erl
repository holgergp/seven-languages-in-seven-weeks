-module (errorLog).
-export ([errorLog/1]).

errorLog
	(erfolg) -> "Erfolg";
errorLog({fehler,Nachricht}) -> io:format("Fehler: ~s~n", [Nachricht]).
