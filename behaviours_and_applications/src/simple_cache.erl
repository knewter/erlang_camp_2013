%%% @author Josh Adams
%%% @doc Simple Cache
%%% @copyright 2013 PUBLIC DOMAIN GEEBUS

-module(simple_cache).
-behaviour(gen_server).
%-export([start_link/0, insert/2, lookup/1]).
-export([start_link/0]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Client API %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% @doc Starts the cache
-spec start_link() -> pid().
start_link() ->
    Pid = gen_server:start_link(?MODULE, [], []),
    {ok, Pid}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% gen_server callbacks %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
init(ServerState) -> {ok, ServerState}.

code_change(_, _, _) -> ok.

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Test Descriptions %%%
%%%%%%%%%%%%%%%%%%%%%%%%%

start_link_test() ->
    ?assertEqual({ok, _}, start_link()).
-endif.
