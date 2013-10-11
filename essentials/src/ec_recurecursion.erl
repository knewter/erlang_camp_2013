%%% @author Josh Adams
%%% @doc Recurecursion
%%% @copyright 2013 PUBLIC DOMAIN GEEBUS

-module(ec_recurecursion).
-export([loop/1, sum_seq/1]).

%% @doc loop a bit to recur...
-spec loop(integer()) -> ok.
loop(0) ->
    ok;
loop(N) ->
    loop(N-1).

%% doc add stuff sequentially
-spec sum_seq(integer()) -> integer().
sum_seq(0) -> 0;
sum_seq(N) -> N + sum_seq(N - 1).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Test Descriptions %%%
%%%%%%%%%%%%%%%%%%%%%%%%%

loop_test() ->
    ?assertEqual(ok, loop(0)),
    ?assertEqual(ok, loop(3)).

sum_seq_test() ->
    ?assertEqual(sum_seq(0), 0),
    ?assertEqual(sum_seq(3), 6).
-endif.
