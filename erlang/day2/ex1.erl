-module (ex1).
-export ([lookup/2]).
-export ([testValue/0]).
-export ([patternMatchLookup/2]).
-export ([testPatternMatchLookup/0]).

lookup(Key,List)  -> [{_, X}] = listElement(Key,List),X.
listElement(Key,List) ->lists:filter(fun({K,_})  -> K =:= Key end, List).

testValue()  -> lookup(erlang,[{erlang,"Erlang eine funktionale Sprache"},{ruby,"Eine OO Sprache"}]).

patternMatchLookup(_,[]) -> false;
patternMatchLookup(K,[{K,V}|_]) -> V;
patternMatchLookup(K,[_|T]) -> patternMatchLookup(K,T).

testPatternMatchLookup()  -> patternMatchLookup(erlang,[{erlang,"Erlang eine funktionale Sprache"},{ruby,"Eine OO Sprache"}]).