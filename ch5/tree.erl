-module(tree).
-export([empty/0, insert/3, lookup/2]).

empty() -> {node, 'nil'}.

insert(Key, Val, {node,'nil'}) ->
  {node, {Key, Val, {node, 'nil'}, {node, 'nil'}}};

insert(NewKey, NewVal, {node, {Key, Val, Smaller, Larger}}) when NewKey < Key ->
  {node, {Key, Val, insert(NewKey, NewVal, Smaller), Larger}};

insert(NewKey, NewVal, {node, {Key, Val,Smaller, Larger}}) when NewKey > Key -> 
    {node, {Key, Val, Smaller, insert(NewKey, NewVal, Larger)}};

insert(Key, Val, {node, {Key, _, Smaller, Larger}}) ->
  {node, {Key, Val, Smaller, Larger}}.

lookup(_, {node, 'nil'}) ->
  undefined;
lookup(Key, {node, {Key, Val, _, _}}) ->
  {ok, Val};
lookup(Key, {node, {NodeKey, _, Smaller, _}}) when Key < NodeKey ->
  lookup(Key, Smaller);
lookup(Key, {node, {_,_,_, Larger}}) ->
  lookup(Key, Larger).
%%% inserting records
%% T1 = tree:insert("Paul Oguda", "mcpaul2058@gmail.com", tree:empty()).
%% T2 = tree:insert("Mark Gicheru", "markgich@gmail.com", T1).
%% Addresses = tree:insert("Anita Baker", "anitb@gmail.com",tree:insert("Don Carlos", "donc@gmail.com",tree:insert("Vybz Kartel", "vybz@gmail.com", T2))).
%% reading records
%% tree:lookup("Anita Baker", Addresses).
%% tree:lookup("Unknown Negro", Addresses).

