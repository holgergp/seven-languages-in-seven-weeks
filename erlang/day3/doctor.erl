-module(doctor).
-export([loop/0]).
loop() ->
    process_flag(trap_exit, true), 
    receive
        new ->
            io:format("Creating and monitoring process.~n"),
            register(translator, spawn_link(fun translate_service:loop/0)),
            loop();
        {'EXIT', From, Reason} -> 
            io:format("The translator ~p exitedt with reason ~p.", [From, Reason]),
			io:format(" Restarting. ~n"),
            self() ! new, 
            loop()
        end.