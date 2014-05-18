
-module(translate_service).
-export([loop/0, translate/2]).
loop() ->
    receive
        {From, "casa"} -> 
            From ! "house", 
            loop();       
		
        {From, "blanca"} -> 
            From ! "white", 
            loop();

        {From, "42"} -> 
            From ! "42", 
            exit({translate_service,die,at,erlang:time()}),
            loop();
        
        {From, _} -> 
            From ! "I don't understand.", 
 
            loop()       
end.

translate(To, Word) ->
    To ! {self(), Word}, 
    receive
        Translation -> Translation
    end.

