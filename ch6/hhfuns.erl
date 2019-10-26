-module(hhfuns).
-compile(export_all).

one() -> 1.
two() -> 2.

add(X,Y) -> X() + Y().

%% hhfuns:add(fun hhfuns:one/0. fun hhfuns:two/0).

increment([]) -> [];
increment([H|T]) -> [H+1|increment(T)].

decrement([]) -> [];
decrement([H|T]) -> [H+1|decrement(T)].

map(_, []) -> [];
map(F, [H|T]) -> [F(H)|map(F,T)].

incr(X) -> X + 1.
decr(X) -> X - 1.

%% L = [1,2,3,4,5].
%% hhfuns:increment(L).
%% hhfuns:decrement(L).
%% hhfuns:map(fun hhfuns:incr/1, L).
%% hhfuns:map(fun hhfuns:decr/1, L).

%%Anonymous functions
%%Fn = fun() -> a end.
%%Fn().
%% PrepareAlarm = fun(Room) ->
%% io:format("Alarm set in ~s. ~n", [Room]),
%% fun() -> io:format("Alarm tripped in ~s! Call Batman! ~n", [Room]) end
%% end.

%% AlarmReady = PrepareAlarm("bathroom").
%% AlarmReady().

a() ->
  Secret = "pony",
fun() -> Secret end.

b(F) ->
  "a/0's password is " ++ F().


%% hhfuns:b(hhfuns:a()).


%%Base = 2.
%% PowerOfTwo = fun(X) -> math:pow(Base, X) end.
%% hhfuns:map(PowerOfTwo, [1,2,3,4,5,6]).

base() ->
  A = 1,
  (fun(A) -> A = 2 end)(2).

%% Only keep even numbers
even(L) -> lists:reverse(even(L, [])).

even([], Acc) -> Acc;
even([H|T], Acc) when H rem 2 == 0 ->
  even(T, [H|Acc]);
even([_|T], Acc) ->
  even(T, Acc).

%% only keep men older than 60.
old_men(L) -> lists:reverse(old_men(L, [])).

old_men([], Acc) -> Acc;
old_men([Person = {male, Age}| People], Acc) when Age > 60 ->
  old_men(People, [Person|Acc]);

old_men([_|People], Acc) ->
  old_men(People, Acc).

filter(Pred, L) -> lists:reverse(filter(Pred, L, [])).

filter(_, [], Acc) -> Acc;

filter(Pred, [H|T], Acc) ->
  case Pred(H) of
    true -> filter(Pred, T, [H|Acc]);
    false -> filter(Pred, T, Acc)
  end.
%% Numbers = lists:seq(1, 10).
%% hhfuns:filter(fun(X) -> X rem 2 == 0 end, Numbers).
%% People = [{male, 45}, {female, 67}, {male, 66}, {female, 12}, {unkwown, 174}, {male, 74}].
%% hhfuns:filter(fun({Gender, Age}) -> Gender == male andalso Age > 60 end, People).

%% Find the maximun of a list.
max([H|T]) -> max2(T, H).

max2([], Max) -> Max;
max2([H|T], Max) when H > Max -> max2(T, H);
max2([_|T], Max) -> max2(T, Max).

%% Find the minimum in a list
min([H|T]) -> min(T, H).

min2([], Min) -> Min;
min2([H|T], Min) when H < Min -> min2(T, H);
min2([_|T], Min) -> min2(T, Min).

%% Find the sum if all elements of a list.
sum(L) -> sum(L,0).
sum([], Sum) -> Sum;
sum([H|T], Sum) -> sum(T, H + Sum).

fold(_, Start, []) -> Start;
fold(F, Start, [H|T]) -> fold(F, F(H, Start), T).
%% [H|T] = [1,7,3,5,9,0,2,3].
%% hhfuns:fold(fun(A,B) when A > B -> A; (_, B) -> B end, H, T). MAX
%% hhfuns:fold(fun(A,B) when A > B -> A; (_, B) -> B end, H, T). MIN
%% hhfuns:fold(fun(A,B) -> A + B end, 0, lists:seq(1,10)).
