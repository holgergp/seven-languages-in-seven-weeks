-module (count_word).
-export ([count/2]).

count("",N) -> N;
count([32| Tail],N)  -> 
	count(Tail,N+1);

count([_| Tail],N)  -> 
	count(Tail,N).

