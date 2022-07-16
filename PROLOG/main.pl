:- use_module(library(clpfd)).

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
    length(L, 6), maplist(same_length(L), L),
    append(L, S),
    maplist(intervalo, S),
    maplist(limite_regiao, S),
    maplist(adjacente, L),
    transpose(L, Columns),
    maplist(adjacente,Columns),
    igual(0, S, R0),
    igual(1, S, R1),
    igual(2, S, R2),
    igual(3, S, R3),
    igual(4, S, R4),
    igual(5, S, R5),
    igual(6, S, R6),
    igual(7, S, R7),
    igual(8, S, R8),
    igual(9, S, R9),
    igual(10, S, R10),
    Rs = [R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10], diferente(Rs),
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

diferente([H]) :-
    all_distinct(H).
diferente([H|T]) :-
    all_distinct(H),
    diferente(T).

acima_maior([[_,_]]).
acima_maior([[R1,X1],[R2,X2]|T]) :-
    ((R1 #\= R2);
    (X1 #> X2)),
    append([[R2,X2]],T,L),
    acima_maior(L).

igual(_, [], []).
igual(R, [[R1, X1] | T], [X1 | L]) :- R #= R1, igual(R, T, L).
igual(R, [[R1, _] | T], L) :- R #\= R1, igual(R, T, L).

adjacente([[_,_]]).
adjacente([[_,X1],[R2,X2]|T]) :-
    all_distinct([X1,X2]),append([[R2,X2]],T,L), adjacente(L).

intervalo([_,X]) :- X in 1..6.

limite_regiao([R,X]) :-tam_R(R,T), X #=< T.

/* problem(2, Rows), kojun(Rows). */