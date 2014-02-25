-module (ex1).
-export ([lookup/2]).
-export ([testValue/0]).
-export ([ping/0]).

lookup(Key,List)  -> [{_, X}] = listElement(Key,List),X.
listElement(Key,List) ->lists:filter(fun({K,_})  -> K =:= Key end, List).

testValue()  -> lookup(erlang,[{erlang,"Erlang eine funktionale Sprache"},{ruby,"Eine OO Sprache"}]).

ping() -> "Pong".


