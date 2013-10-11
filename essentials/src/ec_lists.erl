%%% @author Josh Adams
%%% @doc manipulates lists
%%% @copyright 2013 PUBLIC DOMAIN GEEBUS

-module(ec_lists).
-export([remove_odd/1, twomult/1, yourmap/2]).

%% @doc remove odd elements form a list of integers
-spec remove_odd(list()) -> list().
remove_odd(List) ->
    remove_odd(List, []).

-spec remove_odd(list(), list()) -> list().
remove_odd([], Acc) ->
    Acc;
remove_odd([H|T], Acc) when H rem 2 == 0 ->
    remove_odd(T, Acc ++ [H]);
remove_odd([_H|T], Acc) ->
    remove_odd(T, Acc).

%% @doc multiply a list of integers by 2
-spec twomult(list()) -> list().
twomult(List) ->
    twomult(List, []).

-spec twomult(list(), list()) -> list().
twomult([], Acc) -> Acc;
twomult([H|T], Acc) ->
    twomult(T, Acc ++ [2*H]).

%% @doc apply a fun() to every list element
-spec yourmap(fun(), list()) -> list().
yourmap(Fun, List) ->
    yourmap(Fun, List, []).

-spec yourmap(fun(), list(), list()) -> list().
yourmap(_Fun, [], Acc) -> Acc;
yourmap(Fun, [H|T], Acc) ->
    yourmap(Fun, T, Acc ++ [Fun(H)]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Test Descriptions %%%
%%%%%%%%%%%%%%%%%%%%%%%%%

remove_odd_test() ->
    ?assertEqual([], remove_odd([])),
    ?assertEqual([2,4], remove_odd([1,2,3,4,5])).

twomult_test() ->
    ?assertEqual([2,4], twomult([1,2])).

yourmap_test() ->
    ?assertEqual([2, 4], yourmap(fun(X) -> 2*X end, [1,2])).
-endif.
