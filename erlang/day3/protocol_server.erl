-module(protocol_server).
-behaviour(gen_server).

% http://www.erlang.org/doc/design_principles/gen_server_concepts.html
% https://github.com/mpereira/seven-languages-in-seven-weeks/blob/master/erlang_day_3.md
% Required by gen_server
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

% The actual module API
-export([start/1, log/1]).

%start the server
start(File) -> gen_server:start_link({local, ?MODULE}, ?MODULE, [File], []).

log(Message) -> gen_server:call(?MODULE, Message). 

%init the server
init([File]) -> {ok, File}.

%server call
handle_call(Message, From, File) ->
  {ok, FilePointer} = file:open(File, [append]),
  io:format(FilePointer, "~w: ~p~n", [From, Message]),
  file:close(FilePointer),
  {reply, ok, File}.

% Required but unused
handle_cast(_Message, File) -> {noreply, File}.
handle_info(_Message, File) -> {noreply, File}.
terminate(_Reason, _File) -> ok.
code_change(_OldVersion, File, _Extra) -> {ok, File}.