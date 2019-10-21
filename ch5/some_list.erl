-module(some_list).
-export([sublist/2, tail_sublist/2]).
-import(lists, [reverse/1]).

sublist(_,0) -> [];
sublist([],_) -> [];
sublist([H|T], N) when N > 0 -> [H|sublist(T, N - 1)].

tail_sublist(L, N) -> reverse(tail_sublist(L, N, [])).

tail_sublist(_,0, SubList) -> SubList;
tail_sublist([],_, SubList) -> SubList;
tail_sublist([H|T], N, SubList)  when N > 0 ->
  tail_sublist(T, N-1, [H|SubList]).

