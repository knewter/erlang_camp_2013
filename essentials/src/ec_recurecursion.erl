%%% @author Josh Adams
%%% @doc Recurecursion
%%% @copyright 2013 PUBLIC DOMAIN GEEBUS

-module(ec_recurecursion).
-export([loop/1]).

%% @doc loop a bit to recur...
-spec loop(integer()) -> ok.
loop(0) ->
    ok;
loop(N) ->
    loop(N-1).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Test Descriptions %%%
%%%%%%%%%%%%%%%%%%%%%%%%%

loop_test() ->
    ?assertEqual(ok, loop(0)),
    ?assertEqual(ok, loop(3)).
-endif.
