%%% @author Josh Adams
%%% @doc contains add func
%%% @copyright 2013 PUBLIC DOMAIN GEEBUS

-module(ec_add).
-export([add/2]).

%% @doc adds two numbers together.
-spec add((number(), number()) -> number().
add(A, B) ->
    A + B.
