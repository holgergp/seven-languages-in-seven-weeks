-module (tictactoe2).
-export([tic_tac_toe/1]).

tic_tac_toe({Z, Z, Z, _, _, _, _, _, _}) -> io:format("Gewinner ist: ~p~n", [Z]);
tic_tac_toe({_, _, _, Z, Z, Z, _, _, _}) -> io:format("Gewinner ist: ~p~n", [Z]);
tic_tac_toe({_, _, _, _, _, _, Z, Z, Z}) -> io:format("Gewinner ist: ~p~n", [Z]);
tic_tac_toe({Z, _, _, Z, _, _, Z, _, _}) -> io:format("Gewinner ist: ~p~n", [Z]);
tic_tac_toe({_, Z, _, _, Z, _, _, Z, _}) -> io:format("Gewinner ist: ~p~n", [Z]);
tic_tac_toe({_, _, Z, _, _, Z, _, _, Z}) -> io:format("Gewinner ist: ~p~n", [Z]);
tic_tac_toe({Z, _, _, _, Z, _, _, _, Z}) -> io:format("Gewinner ist: ~p~n", [Z]);
tic_tac_toe({_, _, Z, _, Z, _, Z, _, _}) -> io:format("Gewinner ist: ~p~n", [Z]);

tic_tac_toe(List) -> HatLeereFelder = lists:any(fun(X) -> X == ' ' end, tuple_to_list(List)), 
                     if 
                        HatLeereFelder == true -> io:format("Noch kein Gewinner, aber Züge offen ~n");
                        HatLeereFelder == false -> io:format("Unentschieden! ~n")
                     end.