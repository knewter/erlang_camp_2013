%%% @author Josh Adams
%%% @doc manipulates lists
%%% @copyright 2013 PUBLIC DOMAIN GEEBUS

-module(ec_lists).
-export([remove_odd/1]).

%% @doc remove odd elements form a list of integers
-spec remove_odd(list()) -> list().
remove_odd(List) ->
	remove_odd(List, []).

-spec remove_odd(list(), list()) -> list().
remove_odd([], Acc) ->
	Acc;
remove_odd([H|T], Acc) when H rem 2 == 0 ->
	remove_odd(T, [H|Acc]);
remove_odd([_H|T], Acc) ->
	remove_odd(T, Acc).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Test Descriptions %%%
%%%%%%%%%%%%%%%%%%%%%%%%%

remove_odd_test() ->
    ?assertEqual([], remove_odd([])),
    ?assertEqual([2,4], remove_odd([1,2,3,4,5])).
-endif.
