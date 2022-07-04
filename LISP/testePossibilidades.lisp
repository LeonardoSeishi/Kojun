(load "matriz")               ;arquivo que ajuda na manipulação de matrizes (retorna matrizes modificadas, os dados em um indice e entre outros)
(load "checarAcimaAbaixo")    ;regra dos valores acima ter que ser maior que o debaixo dentro de uma mesma regiao
(load "verificarRegiao")      ;regra em que o numero dentro de uma região não pode repetir
(load "checarAdjacente")      ;regra em que numero adjacentes não podem ser iguais


#|resolverTabuleiro :: [[(Int,Int,Int,Int)]]-> [[(Int,Int,Int,Int)]]
resolverTabuleiro (l1:l) = resolverTabuleiroLinha (l1:l) l l1 |#

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
            (for matriz resto_linha (cdr linha_atual) (car linha_atual) (testarvalores matriz (car linha_atual) (getTamanhoRegiao matriz (car(cdr(cdr(car linha_atual)))) )));(testarValores matriz (car linha_atual) (getTamanhoRegiao matriz (car(cdr(cdr(car linha_atual))))) ) )
            (resolverTabuleiroLinha matriz resto_linha (cdr linha_atual) )
        )
    )
)

#|resolverTabuleiroLinha :: [[(Int,Int,Int,Int)]] -> [[(Int,Int,Int,Int)]] -> [(Int,Int,Int,Int)] -> [[(Int,Int,Int,Int)]]
resolverTabuleiroLinha mat [] [] = mat 
resolverTabuleiroLinha mat (l1:l) [] = resolverTabuleiroLinha mat l l1
resolverTabuleiroLinha mat l ((x,y,r,v):t) = 
    if v == 0 then
        for mat l t (x,y,r,v) (testarValores mat (x,y,r,v) (getTamanhoRegiao mat r)) 
    else
        resolverTabuleiroLinha mat l t|#

(defun for (mat resto_l resto_l_atual pos_atual lista_val)
    (if (null lista_val)
        ()
        (if (null (setq next_mat (resolvertabuleiroLinha (alterarLista mat (car pos_atual) (car(cdr pos_atual)) (car lista_val)) resto_l resto_l_atual) ))
            (for mat resto_l resto_l_atual pos_atual (cdr lista_val))
            next_mat
        )
    )
)


#|for :: [[(Int,Int,Int,Int)]] -> [[(Int,Int,Int,Int)]] -> [(Int,Int,Int,Int)] -> (Int,Int,Int,Int) -> [Int] -> [[(Int,Int,Int,Int)]]
for _ _ _ _ [] = []
for mat l t (x,y,r,v) (valor:valores) = do
    next_mat <- resolverTabuleiroLinha (alterarTupla mat x y valor) l t 
    if next_mat == [] then --se foi retornado uma lista vazia, ele testará outro valor possivel
        for mat l t (x,y,r,v) valores
    else
        return next_mat|#

(defun testarValores (mat pos_atual teste)
    (if (> teste 0)
        (if (and (verificarAcimaAbaixo mat (car pos_atual) (car (cdr pos_atual)) (car(cdr(cdr pos_atual))) teste) (verificarRegiao mat (car(cdr(cdr pos_atual))) teste) (checarAdjacente mat (car pos_atual) (car (cdr pos_atual)) teste) )
            (cons teste (testarValores mat pos_atual (- teste 1)) )
            (testarValores mat pos_atual (- teste 1))
        )
        ()
    )
)

#|testarValores :: [[(Int,Int,Int,Int)]] -> (Int,Int,Int,Int) ->  Int -> [Int]
testarValores mat (x,y,r,v) teste =
    if (teste > 0) then 
        if (verificarAcimaAbaixo mat x y r teste) && (verificarRegiao mat r teste) && (checarAdjacente mat x y teste) then
            [teste] ++ (testarValores mat (x,y,r,v) (teste -1) )
        else
            (testarValores mat (x,y,r,v) (teste- 1) )
    else
        []|#