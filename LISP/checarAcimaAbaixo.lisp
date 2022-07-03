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


