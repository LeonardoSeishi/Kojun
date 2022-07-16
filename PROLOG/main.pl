:- use_module(library(clpfd)).

/*tam_R(0,2).
tam_R(1,2).
tam_R(2,5).*/

tam_R(0 ,4).
tam_R(1 ,4).
tam_R(2 ,5).
tam_R(3 ,1).
tam_R(4 ,1).
tam_R(5 ,2).
tam_R(6 ,4).
tam_R(7 ,2).
tam_R(8 ,6).
tam_R(9 ,2).
tam_R(10,5).

kojun(L) :-
    append(L, S),
    maplist(intervalo, S),
    maplist(limite_regiao, S),
    maplist(adjacente, L),
    transpose(L, Columns),
    maplist(adjacente,Columns),
    maplist(acima_maior, Columns).

problem(1, [[[0,2],[0,1],[1,2]],
            [[2,3],[2,4],[1,1]],
            [[2,2],[2,1],[2,5]]
           ]).

problem(2, [[[0,_],[1,_],[1,4],[1 ,_],[2 ,2],[3 ,_]],
            [[0,_],[4,_],[1,3],[2 ,_],[2 ,_],[2 ,_]],
            [[0,1],[0,4],[5,_],[2 ,4],[6 ,_],[6 ,_]],
            [[7,_],[8,5],[5,_],[9 ,_],[9 ,_],[6 ,2]],
            [[7,_],[8,_],[8,_],[10,_],[10,3],[6 ,_]],
            [[8,6],[8,2],[8,_],[10,2],[10,_],[10,5]]]).

/*adjacente([[R1,X1],[R2,X2],[R3,X3]]) :-
    (all_distinct([X1,X2]); not(all_distinct([R1,R2]))),
    (all_distinct([X3,X2]); not(all_distinct([R3,R2]))).
    %append([[R2,X2]],T,L), adjacente(L).*/

adjacente([[_,_]]).
adjacente([[_,X1],[R2,X2]|T]) :-
    all_distinct([X1,X2]),
    append([[R2,X2]],T,L), adjacente(L).

acima_maior([[_,_]]).
acima_maior([[R1,X1],[R2,X2]|T]) :-
    ((R1 #\= R2); (X1 > X2)),
    append([[R2,X2]],T,L), 
    acima_maior(L).


intervalo([_,X]) :- X in 1..5.

limite_regiao([R,X]) :-tam_R(R,T), X #=< T.