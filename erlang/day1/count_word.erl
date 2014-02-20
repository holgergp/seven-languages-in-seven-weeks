-module (count_word).
-export ([wordcount/1]).


wordcount([]) -> 0;
wordcount(Sentence) -> count(Sentence,1).

count("",N) -> N;
count([32| Tail],N)  -> 
	count(Tail,N+1);

count([_| Tail],N)  -> 
	count(Tail,N).

