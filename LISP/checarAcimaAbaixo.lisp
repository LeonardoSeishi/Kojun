(load "matriz")

#| função responsável por retornar se é possível colocar o valor passado na posição
   com os 2 critérios das outras funções abaixo |#
(defun verificarAcimaAbaixo  (mat lin col reg val)
    (and (checarAcimaMaior mat lin col reg val) (checarAbaixoMenor mat lin col reg val) )
)
#| mat = matriz| lin = linha| col = coluna| reg = regiao| val = valor |#


;checa se o valor acima é da mesma região e é maior que valor passado
(defun checarAcimaMaior (mat lin col reg val)
    (if (= (getRegLinha mat (- lin 1) col) reg)
        (if (or (> (getPosLinha mat (- lin 1) col) val) (= (getPosLinha mat (- lin 1) col) 0))
            T
            NIL )
        T
    )
)


;a mesma regra da função acima porém checando a posição da linha debaixo
(defun checarAbaixoMenor (mat lin col reg val)
    (if (= (getRegLinha mat (+ lin 1) col) reg)
        (if (< (getPosLinha mat (+ lin 1) col) val) 
            T
            NIL )
        T
    )
)


(setq tabuleiro (list 
                (list '(0 0 0 0) '(0 1 1 0) '(0 2 1 4) '(0 3 1  0) '(0 4 2  2) '(0 5 3  0)) 
                (list '(1 0 0 0) '(1 1 4 0) '(1 2 1 3) '(1 3 2  0) '(1 4 2  0) '(1 5 2  0))
                (list '(2 0 0 1) '(2 1 0 4) '(2 2 5 0) '(2 3 2  4) '(2 4 6  0) '(2 5 6  0))
                (list '(3 0 7 0) '(3 1 8 5) '(3 2 5 0) '(3 3 9  0) '(3 4 9  0) '(3 5 6  2))
                (list '(4 0 7 0) '(4 1 8 0) '(4 2 8 0) '(4 3 10 0) '(4 4 10 3) '(4 5 6  0))
                (list '(5 0 8 6) '(5 1 8 2) '(5 2 8 0) '(5 3 10 2) '(5 4 10 0) '(5 5 10 5))
                )
        )

(write-line (write-to-string (verificaracimaabaixo tabuleiro 4 1 8 4)))
(write-line (write-to-string(verificaracimaabaixo tabuleiro 4 1 8 1)))
(write-line (write-to-string(verificaracimaabaixo tabuleiro 4 1 8 2)))
(write-line (write-to-string(verificaracimaabaixo tabuleiro 4 1 8 7)))


