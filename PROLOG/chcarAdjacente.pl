:- use_module(library(clpfd)).
adjacente([[_,_]]).
adjacente([[R1,X1],[R2,X2]|T]) :-
    (all_distinct([X1,X2]); (R1 #= R2))
    ,append([[R2,X2]],T,X),
    adjacente(X).

todas_adjacente([]).
todas_adjacente([H|T]) :- adjacente(H), todas_adjacente(T).