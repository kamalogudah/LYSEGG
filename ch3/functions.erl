- module(functions).
- export([head/1, second/1, same/2,valid_time/1, old_enough/1, right_age/1, wrong_age/1]).
head([H|_]) -> H.
second([_,X|_]) -> X.
same(X,X) ->
    true;
same(_X,_Y) ->
    false.
valid_time({Date = {Y, M,D}, Time = {H, Min, S}}) ->
    io:format("The Date tuple (~p) says today is: ~p/~p/~p, ~n", [Date, Y,M,D]),
    io:format("The Time tuple (~p) indicates : ~p:~p:~p. ~n", [Time, H,Min,S]);

valid_time(_) ->
    io:format("Stop feeding me wrong data! ~n").

%% Guards
old_enough(X) when X >= 16 -> true;
old_enough(_) ->
  false.

right_age(X) when X >= 16, X =< 104 ->
  true;
right_age(_) ->
  false.

wrong_age(X) when X < 16; X > 104 ->
  true;

wrong_age(_) ->
  false.

