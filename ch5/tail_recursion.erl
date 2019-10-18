-module(tail_recursion).
-export([tail_fac/1, tail_len/1]).

tail_fac(N) -> tail_fac(N,1).
tail_fac(0, Acc) -> Acc;
tail_fac(N, Acc) when N > 0 -> tail_fac(N-1, N*Acc).

tail_len(L) -> tail_len(L, 0).
tail_len([], Acc) -> Acc;
tail_len([_|T], Acc) -> tail_len(T, Acc + 1).

tail_sublist(L, N) ->
    tail_sublist(L, N, []).

tail_sublist(_, 0, Sublist) -> Sublist;
tail_sublist([], _, Sublist) -> Sublist;
tail_sublist([H|T], N, Sublist) when N > 0 ->
     tail_sublist(T, N-1, [H|Sublist]).
