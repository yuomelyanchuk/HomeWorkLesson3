
-module(bs02).

%% API
-export([words/1]).


words(A) ->
  words(A,[]).
first_word(L) ->
  first_word(L,<<>>).

first_word(<<" ",Rest/binary>>,A)->
   [A|Rest];
first_word(<<X,Rest/binary>>,A)->
  first_word(Rest,<<A/binary,X>>);
first_word(<<"",_Rest/binary>>,A)->[A|[]].

words([A|[]],Acc)->p05:reverse([A|Acc]);
words([H|T],Acc) ->
  words(first_word(T),[H|Acc]);
words(A,Acc)->words(first_word(A),Acc).

