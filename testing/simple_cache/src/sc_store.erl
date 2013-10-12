-module(sc_store).

-export([
         init/0,
         insert/3,
         delete/2,
         lookup/2
        ]).
init() ->
    dict:new().

insert(Store, Key, Value) ->
    dict:store(Key, Value, Store).

lookup(Store, Key) ->
    dict:find(Key, Store).

delete(Store, Key) ->
    dict:erase(Key, Store).

-ifndef(NOTEST).
-include_lib("eunit/include/eunit.hrl").

exercise_store_test_() ->
    {foreach, fun setup/0, fun cleanup/1,
     [fun() -> X end || X <- [fun can_insert/1, fun can_delete/1, fun delete_nonexistent_key/1, fun insert_over_key/1]]}.

setup() ->
    Dict0 = init(),
    insert(Dict0, key, value).

cleanup(_) ->
    ok.

can_insert(Dict1) ->
    ?assertMatch({ok, value}, lookup(Dict1, key)).

can_delete(Dict1) ->
    Dict2 = delete(Dict1, key),
    ?assertMatch(error, lookup(Dict2, key)).

delete_nonexistent_key(Dict1) ->
    Dict2 = delete(Dict1, key),
    Dict3 = delete(Dict2, key),
    ?assertMatch(error, lookup(Dict3, key)).

insert_over_key(Dict1) ->
    Dict2 = insert(Dict1, key, value2),
    ?assertMatch({ok, value2}, lookup(Dict2, key)).

-endif.
