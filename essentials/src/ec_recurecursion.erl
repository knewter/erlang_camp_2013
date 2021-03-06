%%% @author Josh Adams
%%% @doc Recurecursion
%%% @copyright 2013 PUBLIC DOMAIN GEEBUS

-module(ec_recurecursion).
-export([loop/1, sum_seq/1, hr/1]).

%% @doc loop a bit to recur...
-spec loop(integer()) -> ok.
loop(0) ->
    ok;
loop(N) ->
    loop(N-1).

%% @doc add stuff sequentially
-spec sum_seq(integer()) -> integer().
sum_seq(0) -> 0;
sum_seq(N) -> N + sum_seq(N - 1).

%% @doc output a horizontal rule composed of the specified number of hyphens
-spec hr(integer()) -> string().
hr(N) ->
    hr(N, []).
-spec hr(integer(), string()) -> string().
hr(0, Accum) ->
    Accum;
hr(N, Accum) ->
    hr(N-1, Accum ++ "-").

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Test Descriptions %%%
%%%%%%%%%%%%%%%%%%%%%%%%%

loop_test() ->
    ?assertEqual(ok, loop(0)),
    ?assertEqual(ok, loop(3)).

sum_seq_test() ->
    ?assertEqual(0, sum_seq(0)),
    ?assertEqual(6, sum_seq(3)).

hr_test() ->
    ?assertEqual("---", hr(3)),
    ?assertEqual("------", hr(6)).
-endif.
