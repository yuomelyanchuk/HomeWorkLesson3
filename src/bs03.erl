
-module(bs03).
-export([split/2]).


%%skip_n_bytes
skip(S,0) ->  S;
skip(<<_X,Rest/binary>>,N)->skip(Rest,N-1).


%%length
len(A) ->
  len(A,0).
len(<<"">>,N)->N;
len(<<_X,Rest/binary>>,N)->
  len(Rest,N+1).

%% read_n_bytes
read(A, N) ->
  read(A,N,<<>>).
read(<<"">>,_N,_Acc)-><<"">>;
read(_A,0,Acc)->Acc;
read(<<X,Rest/binary>>,N,Acc)->
  read(Rest,N-1,<<Acc/binary,X>>).

%%get_next_column
next_word(L,Spl) ->
  next_word(L,Spl,<<>>).
next_word(<<"">>,_Spl,A)->[A|[]];
next_word(L,Spl,A)->
  <<X,Rest/binary>>=L,
  Tmp_=len(Spl),
  Tmp=read(L,Tmp_),
  if
    Spl==Tmp -> [A|skip(L,Tmp_)];
    true -> next_word(Rest,Spl,<<A/binary,X>>)
  end.



split(A,Spl) ->
    split(A, list_to_binary(Spl),[]).
split([],_Spl,Acc)->p05:reverse(Acc);
split(A,Spl,Acc)->
  [H|T]=next_word(A,Spl),
  split(T,Spl,[H|Acc]).


