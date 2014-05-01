-module (tictactoe).
-export([tictactoe/1]).
-export([testTictactoe/0]).
-export([ueberpruefeHorizontal/1]).

%Small = fun(X) -> X < 2 end.

% Try to solve the assignment by splitting the list and looking at three tuples each
% Not that straghtforward, doesn't work yet alternative solution seems simpler

matchGleich(X) -> 

	case X of
			{x,x,x} -> x;
			{o,o,o} -> o;
			{_,_,_} -> patt
		end.



ueberpruefeHorizontal(Spielfeld) -> 
		lists:foldl(fun (X,Sofar) -> (matchGleich(X)/=patt) or Sofar end,false,Spielfeld).		

ueberpruefeVertikal(Spielfeld) -> 
		[{Vertikal}||Vertikal->Spielfeld],
		lists:foldl(fun (X,Sofar) -> (matchGleich(X)/=patt) or Sofar end,false,Spielfeld).	

ueberpruefeQuer(Spielfeld) -> 
		[{Vertikal}||Vertikal->Spielfeld],
		lists:foldl(fun (X,Sofar) -> (matchGleich(X)/=patt) or Sofar end,false,Spielfeld).	



spiele(Spielfeld) -> ueberpruefeHorizontal(Spielfeld).

tictactoe(Spielfeld) -> case spiele(Spielfeld) of 
	x -> "x hat gewonnen!";
	o -> "o hat gewonnen!";
	patt -> "Kein Zug mehr möglich";
	kein_sieger ->"Kein Sieger!";
	_ -> "Programm ist noch nicht fertig!"
end.
testTictactoe() -> tictactoe([{x,o,o},{x,o,o},{x,o,x}]).
testTictactoe2() -> tictactoe([{x,o,o,x,o,o,x,o,x}).