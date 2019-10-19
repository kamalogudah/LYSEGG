-module(binary_data).
-export([get_pixels/0, compress_binary/0]).

get_pixels() ->
  Pixels = << 213, 45, 132, 64, 76, 32, 76, 0,0, 234, 32, 15 >>,
  << Pix1:24, Pix2:24,Pix3:24,Pix4:24>> = Pixels,
  io:format("Pix1 is: ~p ~n", [Pix1]),
  io:format("Pix2 is: ~p ~n", [Pix2]),
  io:format("Pix3 is: ~p ~n", [Pix3]),
  io:format("Pix4 is: ~p ~n", [Pix4]).
  %% RGB = [ {R, G, B} || <<R:8, G:8, B:8>> <= Pixels].
  %% [{213,45,132}, {64, 76, 32}, {76, 0,0}, {234, 32, 15} ]
  %% convert back to binary
  %% << <<R:8, G:8, B:8>> || {R,G,B} <- RGB >>.
compress_binary() ->
    List = <<1,2,3,4,5,6,7,8,9,10>>,
    GoodStuff = << <<X>> || <<X>> <= List, X rem 2 == 0 >>,
    io:format("The good list:  ~p ~n", [GoodStuff]).