%%% @author Josh Adams
%%% @doc lol concurrency
%%% @copyright 2013 PUBLIC DOMAIN GEEBUS

-module(ec_concurrent).
-export([bf_seq/1]).

%% @doc print a sequence backwards and forward simultaneously
bf_seq(List) ->
    RL = lists:reverse(List),
    spawn(fun() -> print_seq(List) end),
    spawn(fun() -> print_seq(RL) end),
    ponies.

print_seq([H]) ->
    io:format("~p", [H]);
print_seq([H|T]) ->
    io:format("~p,", [H]),
    print_seq(T).
