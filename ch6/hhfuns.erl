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

