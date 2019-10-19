-module(what_the_if).
-export([heh_fine/0, oh_god/1, help_me/1]).

heh_fine() ->
  if 1 =:= 1 ->
    works
end,
if 1 =:= 2, 1 =:= 1 ->
  works
end,
if 1 =:= 2,1 =:= 1 ->
  fails
end.
oh_god(N) ->
  if N =:= 2 -> might_succeed;
  true -> always_does %% This is Erlang's if's 'else!'
end.

%% Note that this one would be better as a pattern match in function heads!
%% I'm doing it this way for the sake of the example.
help_me(Animal) ->
  Talk = if Animal == cat -> "meow";
           Animal == beef -> "mooo";
           Animal == dog -> "bark";
           Animal == tree -> "bark";
           true -> "ghgjhghg"
end,
 {Animal, "says " ++ Talk ++ "!"}.

%% replacing if statement
%% if X > Y -> a()
%% ; true -> b()
%% end
%% becomes
%% if X > Y -> a()
%% ; X =< Y -> b()
%% end
%% if X > Y -> a()
%% ; X < Y -> b()
%% ; true -> c()
%% end
%% becomes
%% if X > Y -> a()
%% ; X < Y -> b()
%% X == Y -> c()
%% end

