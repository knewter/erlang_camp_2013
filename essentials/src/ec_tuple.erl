%%% @author Josh Adams
%%% @doc tupley things
%%% @copyright 2013 PUBLIC DOMAIN GEEBUS

-module(ec_tuple).
-export([match_tuple/1]).

%% @doc Add for tag a, multiply for tag b
-spec match_tuple(tuple()) -> integer().
match_tuple(Tuple) ->
    case Tuple of
        {tag_a, {First, Second, Third}} -> First + Second + Third;
        {tag_b, {First, Second, Third}} -> First * Second * Third
    end.

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Test Descriptions %%%
%%%%%%%%%%%%%%%%%%%%%%%%%

match_tuple_test() ->
    ?assertEqual(9, match_tuple({tag_a, {2, 3, 4}})),
    ?assertEqual(24, match_tuple({tag_b, {2, 3, 4}})).
-endif.
