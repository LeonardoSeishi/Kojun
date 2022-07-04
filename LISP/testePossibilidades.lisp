(load "matriz")               ;arquivo que ajuda na manipulação de matrizes (retorna matrizes modificadas, os dados em um indice e entre outros)
(load "checarAcimaAbaixo")    ;regra dos valores acima ter que ser maior que o debaixo dentro de uma mesma regiao
(load "checarRegiao")         ;regra em que o numero dentro de uma região não pode repetir
(load "checarAdjacente")      ;regra em que numero adjacentes não podem ser iguais


(defun resolverTabuleiro (matriz)
    (resolverTabuleiroLinha matriz (cdr matriz) (car matriz))
)

(defun resolverTabuleiroLinha (matriz resto_linha linha_atual)
    (if (null linha_atual)
        (if (null resto_linha)
            matriz
            (resolverTabuleiroLinha matriz (cdr resto_linha) (car resto_linha))
        )
        (if (= (car(last(car linha_atual))) 0)
            (for matriz resto_linha (cdr linha_atual) (car linha_atual) (testarvalores matriz (car linha_atual) (getTamanhoRegiao matriz (car(cdr(cdr(car linha_atual)))) )))
            (resolverTabuleiroLinha matriz resto_linha (cdr linha_atual) )
        )
    )
)

(defun for (mat resto_l resto_l_atual pos_atual lista_val)
    (if (null lista_val)
        ()
        (if (null (setq next_mat (resolvertabuleiroLinha (alterarLista mat (car pos_atual) (car(cdr pos_atual)) (car lista_val)) resto_l resto_l_atual) ))
            (for mat resto_l resto_l_atual pos_atual (cdr lista_val))
            next_mat
        )
    )
)

(defun testarValores (mat pos_atual teste)
    (if (> teste 0)
        (if (and (verificarAcimaAbaixo mat (car pos_atual) (car (cdr pos_atual)) (car(cdr(cdr pos_atual))) teste) (verificarRegiao mat (car(cdr(cdr pos_atual))) teste) (checarAdjacente mat (car pos_atual) (car (cdr pos_atual)) teste) )
            (cons teste (testarValores mat pos_atual (- teste 1)) )
            (testarValores mat pos_atual (- teste 1))
        )
        ()
    )
)
