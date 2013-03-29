sum(L) ->
  lists:foldl(fun(X, Sum) -> X + Sum end, 0, L).
