%%% @author Josh Adams
%%% @doc matchinggggg
%%% @copyright 2013 PUBLIC DOMAIN GEEBUS

-module(ec_match).
-export([a_is_a/1, not_less_than_2/1]).

%% @doc checks if a thing is a
-spec a_is_a(a | any()) -> boolean().
a_is_a(a) ->
    true;
a_is_a(_X) ->
    false.

%% @doc outputs a string saying whether a thing is less than 2 or not
%% I don't have a clue how to write this spec, halp?
not_less_than_2(N) when N >= 2 ->
    "N is greater than or equal to 2";
not_less_than_2(_N) ->
    "N is less than 2".

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Test Descriptions %%%
%%%%%%%%%%%%%%%%%%%%%%%%%

check_if_a_thing_is_a_test() ->
    ?assertEqual(true, a_is_a(a)),
    ?assertEqual(false, a_is_a(b)).

check_if_a_thing_is_less_than_2_test() ->
    ?assertEqual("N is greater than or equal to 2", not_less_than_2(3)),
    ?assertEqual("N is less than 2", not_less_than_2(1)).
-endif.
