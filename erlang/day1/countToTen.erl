-module (countToTen).
-export ([countToTen/0]).

countToTen() -> toTen(1).

toTen(10)  -> 10;
toTen(N) -> io:format("~w~n", [N]),
	toTen(N+1).