%%% @author Josh Adams
%%% @doc matchinggggg
%%% @copyright 2013 PUBLIC DOMAIN GEEBUS

-module(ec_match).
-export([a_is_a/1]).

%% @doc checks if a thing is a
-spec a_is_a(a | any()) -> boolean().
a_is_a(a) ->
    true;
a_is_a(_X) ->
    false.

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Test Descriptions %%%
%%%%%%%%%%%%%%%%%%%%%%%%%

check_if_a_thing_is_a_test() ->
    ?assertEqual(true, a_is_a(a)),
    ?assertEqual(false, a_is_a(b)).
-endif.
