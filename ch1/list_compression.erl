-module(list_compression).
-compile(export_all).


results() ->
    RestaurantMenu = [{steak, 5.99}, {beer, 3.99}, {poutine, 3.50}, {kitten, 20.99}, {water, 0.00}],
    Menu = [{Item, Price * 1.07} || {Item, Price} <- RestaurantMenu, Price >= 3, Price =< 10],
    io:format("Menu: ~p ~n", [Menu]).
