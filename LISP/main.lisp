module Main (main) where

import TestePossibilidades


#|quase todas as funcionalidades desse programa possuem duas funções 
para garantir que ele passe por todas as linhas e colunas de uma matriz

* 1 = linha atual l = resto das listas  t = outras tuplas na mesma linha  (x,y,r,v) = tupla atual
* x = linha  y = coluna  r = regiao  v = valor
* mat = matriz inteira
--> VALE PARA QUASE TODOS AS FUNÇÕES DESSE PROGRAMA <--

matriz com os valores iniciais
[
[0,0,4,0,2,0],
[0,0,3,0,0,0],
[1,4,0,4,0,0],
[0,5,0,0,0,2],
[0,0,0,0,3,0],
[6,2,0,2,0,5]]

regioes da matriz e as posições dentro de cada regiao
[[(0,0),(1,0),(2,0),(2,1)],                     -0
[(0,1),(0,2),(0,3),(1,2)],                      -1
[(0,4),(1,3),(1,4),(1,5),(2,3)],                -2
[(0,5)],                                        -3
[(1,1)],                                        -4
[(2,2),(3,2)],                                  -5
[(2,4),(2,5),(3,5),(4,5)],                      -6
[(3,0),(4,0)],                                  -7
[(3,1),(4,1),(4,2),(5,0),(5,1),(5,2)],          -8
[(3,3),(3,4)],                                  -9
[(4,3),(4,4),(5,3),(5,4),(5,5)]]                -10

 pega a matriz completa e transforma em uma string para o print aparecer apenas os valores |#
(defun formatar(tabuleiro) 
        (if (null tabuleiro)
                ""
                (concatenate 'string (formatarlinha (car tabuleiro)) (formatar (cdr tabuleiro))
                )
        )
)

(defun formatarLinha(linha)
        (if (null linha)
                "~%"    
            (concatenate 'string (write-to-string (car (last (car linha)))) " "
            (formatarLinha (cdr linha)))
        )
)

(defun main()
        (setq tabuleiro (list 
                        (list '(0 0 0 0) '(0 1 1 0) '(0 2 1 4) '(0 3 1  0) '(0 4 2  2) '(0 5 3  0)) 
                        (list '(1 0 0 0) '(1 1 4 0) '(1 2 1 3) '(1 3 2  0) '(1 4 2  0) '(1 5 2  0))
                        (list '(2 0 0 1) '(2 1 0 4) '(2 2 5 0) '(2 3 2  4) '(2 4 6  0) '(2 5 6  0))
                        (list '(3 0 7 0) '(3 1 8 5) '(3 2 5 0) '(3 3 9  0) '(3 4 9  0) '(3 5 6  2))
                        (list '(4 0 7 0) '(4 1 8 0) '(4 2 8 0) '(4 3 10 0) '(4 4 10 3) '(4 5 6  0))
                        (list '(5 0 8 6) '(5 1 8 2) '(5 2 8 0) '(5 3 10 2) '(5 4 10 0) '(5 5 10 5))
                        )
        )
        (format t(formatar tabuleiro))
)

(main)





