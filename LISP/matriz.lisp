

#|  as quatro funções abaixo simulam uma chamada de dados da lista por indices
 ex.: valor = matriz[x][y]
sendo que as duas primeiras são responsáveis por retornar o número da região
e os outros dois retornam o valor na posição  |#

;percorre todas as linhas até achar a linha do indice
(defun getRegLinha (matriz linha coluna)
    (if (null matriz)
        -1
        (if (= linha 0)
            (getRegColuna (car matriz) coluna)
            (getreglinha (cdr matriz) (- linha 1) coluna)
        )
    )
)

#|função de suporte para procurar a coluna desejada a partir da linha que ja 
   foi encontrada pela função anterior e retorna a regiao|#
(defun getRegColuna (linha_matriz coluna)
    (if (null linha_matriz)
        -1
        (if (= coluna 0)
            (car (cdr (cdr (car linha_matriz))))
            (getRegColuna (cdr linha_matriz) (- coluna 1))
        )
    )
)

;a mesma logica acima se aplica a essas outras duas funções, porem retorna o valor desta posicao
(defun getPosLinha (matriz linha coluna)
    (if (null matriz)
        -1
        (if (= linha 0)
            (getPosColuna (car matriz) coluna)
            (getposLinha (cdr matriz) (- linha 1) coluna)
        )
    )
)

                        
(defun getPosColuna (linha_matriz coluna)
    (if (null linha_matriz)
        -1
        (if (= coluna 0)
            (car (last (car linha_matriz)))
            (getPosColuna (cdr linha_matriz) (- coluna 1))
        )
    )
)

;altera alguma lista dentro da matriz com o novo VALOR, o resto continua igual  
(defun alterarLista (matriz linha coluna new_value)
    (if (null matriz)
        ()
        (if (= linha 0)
            (cons (alterarListaLinha (car matriz) coluna new_value) (cdr matriz))
            (cons (car matriz) (alterarLista (cdr matriz) (- linha 1) coluna new_value))
        )
    )
)

(defun alterarListaLinha (linha_matriz coluna new_value)
    (if (null linha_matriz)
        ()
        (if (= coluna 0)
            (cons (list (car(car linha_matriz)) (car(cdr(car linha_matriz))) (car(cdr(cdr(car linha_matriz)))) new_value) (cdr linha_matriz) )
            (cons (car linha_matriz) (alterarListaLinha (cdr linha_matriz) (- coluna 1) new_value) )
        )
    )
)

;função auxiliar que soma o número de posições que se tem uma região desejada
(defun getTamanhoRegiao (matriz reg)
    (if (null matriz)
        0
        (if (= reg (car(cdr(cdr(car(car matriz))))) )
            (+ 1 (getTamanhoRegiaoLinha (cdr(car matriz)) reg) (getTamanhoRegiao (cdr matriz) reg) )
            (+ (getTamanhoRegiaoLinha (cdr(car matriz)) reg) (getTamanhoRegiao (cdr matriz) reg))
        )
    )
)

(defun getTamanhoRegiaoLinha (linha_matriz reg)
    (if (null linha_matriz)
        0
        (if (= reg (car (cdr (cdr (car linha_matriz)))) )
            (+ 1 (getTamanhoRegiaoLinha (cdr linha_matriz) reg))
            (getTamanhoRegiaoLinha (cdr linha_matriz) reg)
        )
    )
)