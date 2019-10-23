-module(recursive).
-export([fac/1, len/1, zip/2, lenient_zip/2, sublist/2, tail_lenient_zip/2]).
-export([quicksort/1, lc_quicksort/1]).
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

%% reverses a list (a truly descriptive function name!)
reverse([]) -> [];
reverse([H|T]) -> reverse(T)++[H].

zip([],[]) -> [];
zip([X|Xs], [Y|Ys]) -> [{X,Y}| zip(Xs,Ys)].

lenient_zip([],_) -> [];
lenient_zip(_,[]) -> [];
lenient_zip([X|Xs], [Y|Ys]) -> [{X,Y}|lenient_zip(Xs,Ys)].

%% tail recursive version of lenient-zip/2
tail_lenient_zip(X,Y) -> reverse(tail_lenient_zip(X,Y,[])).

tail_lenient_zip([],_,Acc) -> Acc;
tail_lenient_zip(_,[],Acc) -> Acc;
tail_lenient_zip([X|Xs],[Y|Ys], Acc) ->
    tail_lenient_zip(Xs,Ys,[{X,Y}|Acc]).


quicksort([]) -> [];
quicksort([Pivot|Rest]) ->
    {Smaller, Larger} = partition(Pivot, Rest,[],[]),
    quicksort(Smaller) ++ [Pivot] ++ quicksort(Larger).

partition(_,[],Smaller, Larger) -> {Smaller, Larger};
partition(Pivot, [H|T], Smaller, Larger) ->
    if H =< Pivot -> partition(Pivot, T, [H|Smaller], Larger);
      H > Pivot -> partition(Pivot, T, Smaller, [H|Larger])
end.

%% quicksort built with list comprehensions rather than with a
%% partition function.
lc_quicksort([]) -> [];
lc_quicksort([Pivot|Rest]) ->
    lc_quicksort([Smaller || Smaller <- Rest, Smaller =< Pivot])
    ++ [Pivot] ++
    lc_quicksort([Larger || Larger <- Rest, Larger > Pivot]).