-module(duplicate).
-export([dup/2, tail_dup/2]).

dup(0,_) ->
  [];

dup(N, Term) when N > 0 ->
  [Term| dup(N-1, Term)].

tail_dup(N,Term) ->
  tail_dup(N, Term, []).

tail_dup(0,_, List) ->
  List;

tail_dup(N, Term, List) when N > 0 ->
  tail_dup(N-1, Term, [Term|List]).
