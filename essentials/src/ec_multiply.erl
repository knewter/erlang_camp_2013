%%% @author Josh Adams
%%% @doc contains mult func
%%% @copyright 2013 PUBLIC DOMAIN GEEBUS

-module(ec_multiply).
-export([mult/2, mult/3]).

%% @doc multiplies two numbers together.
-spec mult(number(), number()) -> number().
mult(A, B) ->
    A * B.

%% @doc multiplies three numbers together.
-spec mult(number(), number(), number()) -> number().
mult(A, B, C) ->
    A * B * C.


-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Test Descriptions %%%
%%%%%%%%%%%%%%%%%%%%%%%%%

multiply_two_numbers_test() ->
    ?assertEqual(8, mult(2, 4)).

multiply_three_numbers_test() ->
    ?assertEqual(24, mult(2, 3, 4)).
-endif.
