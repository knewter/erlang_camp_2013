-module(simple_cache_SUITE).

-include_lib("common_test/include/ct.hrl").
-include_lib("eunit/include/eunit.hrl").

-compile(export_all).

suite() ->
    [{timetrap,{seconds,30}}].

init_per_suite(Config) ->
    application:start(simple_cache),
    Config.

end_per_suite(_Config) ->
    ok.

all() ->
    [my_test_case].

my_test_case(_Config) ->
    simple_cache:insert(foo, bar),
    ?assertMatch({ok, bar}, simple_cache:lookup(foo)).
