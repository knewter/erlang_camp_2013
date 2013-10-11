%%% @author Josh Adams
%%% @doc contains some maths
%%% @copyright 2013 PUBLIC DOMAIN GEEBUS

-module(ec_math).
-export([op/3]).

%% @doc handles addition and subtraction ops
-spec op(add | sub, number(), number()) -> number().
op(add, A, B) ->
    A + B;
op(sub, A, B) ->
    A - B.

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Test Descriptions %%%
%%%%%%%%%%%%%%%%%%%%%%%%%

op_can_add_test() ->
    ?assertEqual(4, op(add, 2, 2)).

op_can_sub_test() ->
    ?assertEqual(0, op(sub, 2, 2)).
-endif.
