-module(recursive).
-export([fac/1, len/1]).
% Getting a factorial
fac(0) -> 1;
fac(N) when N > 0 -> N * fac(N - 1).
%% Getting the length of a list
len([]) -> 0;
len([_|T]) -> 1 + len(T).

%Getting a sublist
% sublist(_,0) ->
%     [];
sublist([],_) ->
    [];
sublist([H|T], N) when N > 0 ->
    [H|sublist(T,N-1)].


