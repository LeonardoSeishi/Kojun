:- use_module(library(clpfd)).

/*tam_R(0,2).
tam_R(1,2).
tam_R(2,5).*/

kojun(L) :-
    length(L, 6), maplist(same_length(L), L),
    append(L, S),
    maplist(intervalo, S),
    maplist(limite_regiao, S),
    maplist(adjacente, L),
    transpose(L, Columns),
    maplist(adjacente,Columns),
    findall(X,igual([0,X],S),R0),
    findall(X,igual([1,X],S),R1),
    findall(X,igual([2,X],S),R2),
    findall(X,igual([3,X],S),R3),
    findall(X,igual([4,X],S),R4),
    findall(X,igual([5,X],S),R5),
    findall(X,igual([6,X],S),R6),
    findall(X,igual([7,X],S),R7),
    findall(X,igual([8,X],S),R8),
    findall(X,igual([9,X],S),R9),
    findall(X,igual([10,X],S),R10),
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

igual([R,X],[[R1,X1]|_]) :- R #= R1, X #= X1.
igual([R,X],[_|T]) :- igual([R,X],T).

adjacente([[_,_]]).
adjacente([[_,X1],[R2,X2]|T]) :-
    all_distinct([X1,X2]),append([[R2,X2]],T,L), adjacente(L).

intervalo([_,X]) :- X in 1..6.

limite_regiao([R,X]) :-tam_R(R,T), X #=< T.