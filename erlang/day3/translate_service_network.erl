  -module(translate_service_network).
  -export([start/1, init/0, translate/2]).


%http://www.erlang.org/doc/reference_manual/distributed.html
% https://github.com/mpereira/seven-languages-in-seven-weeks/blob/master/erlang_day_3.md
  start(Node) ->
    io:format("starting translate_service~n"),
    spawn(Node, ?MODULE, init, []).

  init() ->
    loop().

  loop() ->
    receive
      {From, "casa"}   -> From ! "house";
      {From, "blanca"} -> From ! "white";
      {From, _}        -> From ! "I don't understand."
    end,
    loop().

  translate(To, Word) ->
    To ! {self(), Word},
    receive
      Translation -> Translation
    end.