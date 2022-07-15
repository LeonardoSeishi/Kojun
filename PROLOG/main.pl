:- use_module(library(clpfd)).

tam_R(0,2).
tam_R(1,2).
tam_R(2,5).

kojun(L) :-
    append(L, S),
    maplist(inetrvalo, S),
    maplist(limite_regiao, S),
    maplist(adjacente, L),
    transpose(L, Columns),
    maplist(adjacente,Columns).

problem(1, [[[0,1],[0,2],[1,1]],
            [[2,2],[2,1],[1,2]],
            [[2,3],[2,4],[2,5]]
           ]).

/*adjacente([[R1,X1],[R2,X2],[R3,X3]]) :-
    (all_distinct([X1,X2]); not(all_distinct([R1,R2]))),
    (all_distinct([X3,X2]); not(all_distinct([R3,R2]))).
    %append([[R2,X2]],T,L), adjacente(L).*/

adjacente([[_,_]]).
adjacente([[R1,X1],[R2,X2]|T]) :-
    (all_distinct([X1,X2]); not(all_distinct([R1,R2]))),
    append([[R2,X2]],T,L), adjacente(L).

    

inetrvalo([_,X]) :- X in 1..5.

limite_regiao([R,X]) :-tam_R(R,T), X #=< T.