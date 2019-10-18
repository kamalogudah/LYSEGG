-module(list_compression).

%%-compile(export_all).

-export([get_menu/0, get_foggy_places/0]).

get_menu() ->
    RestaurantMenu = [{steak, 5.99}, {beer, 3.99},
		      {poutine, 3.5}, {kitten, 2.09899999999999984368e+1},
		      {water, 0.0}],
    Menu = [{Item, Price * 1.07}
	    || {Item, Price} <- RestaurantMenu, Price >= 3,
	       Price =< 10],
    io:format("Menu: ~p ~n", [Menu]).

get_foggy_places() ->
    Weather = [{toronto, rain}, {montreal, storms},
	       {london, fog}, {paris, sun}, {boston, fog},
	       {vancouver, snow}],
    FoggyPlaces = [X || {X, fog} <- Weather],
    io:format("Menu: ~p ~n", [FoggyPlaces]).
