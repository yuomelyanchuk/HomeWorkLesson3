
-module(bs01).

%% API
-export([first_word/1]).


first_word(L) ->
  first_word(L,<<>>).

first_word(<<" ",_Rest/binary>>,A)->A;
first_word(<<X,Rest/binary>>,A)->
  first_word(Rest,<<A/binary,X>>);
first_word(<<"",_Rest/binary>>,A)->A.