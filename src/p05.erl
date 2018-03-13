-module(p05).

%% API
-export([reverse/1]).


reverse(H) ->reverse2(H,[]).


reverse2([],A)->A;
reverse2([H|T],A)->reverse2(T,[H|A]).

