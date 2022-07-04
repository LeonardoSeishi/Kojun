(load "matriz")

#| 
    Esta função recebe uma posição e um valor para avaliar,
    Checa se a posição acima é de outra regiao e possui o mesmo valor, se sim retorna True
    Caso contrario retorna False 
|#

(defun avaliarVizinhosLinhaCima (tabuleiro linha coluna val)
    ( if (= (getRegLinha tabuleiro linha coluna) (getRegLinha tabuleiro (- linha 1) coluna))
        T
        (if (= (getPosLinha tabuleiro (- linha 1) coluna) val)
            NIL
            T
        )    
    )
)

#| 
    Esta função recebe uma posição e um valor para avaliar,
    Checa se a posição a baixo é de outra regiao e possui o mesmo valor, se sim retorna True
    Caso contrario retorna False 
|#

(defun avaliarVizinhosLinhaBaixo (tabuleiro linha coluna val)
    (if (= (getRegLinha tabuleiro linha coluna) (getRegLinha tabuleiro (+ linha 1) coluna))
        T
        (if (= (getPosLinha tabuleiro (+ linha 1) coluna) val)
            NIL
            T
        )   
    )
)

#| 
    Esta função recebe uma posição e um valor para avaliar,
    Checa se a posição a esquerda é de outra regiao e possui o mesmo valor, se sim retorna True
    Caso contrario retorna False 
|#

(defun avaliarVizinhosColunaEsq (tabuleiro linha coluna val)
    (if (= (getRegLinha tabuleiro linha coluna) (getRegLinha tabuleiro linha (- coluna 1) ))
        T
        (if (= (getPosLinha tabuleiro linha (- coluna 1)) val)
            NIL
            T
        )
    )
)

#|
    Esta função recebe uma posição e um valor para avaliar,
    Checa se a posição a direita é de outra regiao e possui o mesmo valor, se sim retorna True
    Caso contrario retorna False
|#

(defun avaliarVizinhosColunaDir (tabuleiro linha coluna val)
    (if (= (getRegLinha tabuleiro linha coluna) (getRegLinha tabuleiro linha (+ coluna 1) ))
        T
        (if (= (getPosLinha tabuleiro linha (+ coluna 1)) val)
            NIL
            T
        )
    )
)

#|
    Esta função recebe uma posição e um valor para avaliar,
    Chama todas as funções para avaliar as posições acima, a baixo, a direita e a esquerda
    Se todas retornarem True ela retorna True
    Caso contrario retorna False
|#

(defun checarAdjacente (tabuleiro linha coluna val) 
    (and (avaliarVizinhosColunaDir tabuleiro linha coluna val) (avaliarVizinhosColunaEsq tabuleiro linha coluna val) (avaliarVizinhosLinhaCima tabuleiro linha coluna val) (avaliarVizinhosLinhaBaixo tabuleiro linha coluna val))
)