module ChecarRegiao (verificarRegiao) where

{-- 
Esta função recebe uma listas te tuplas correspondente ao tabuleiro, a região de uma posicao e o valor dela que deseja-se verificar.
O algoritmo verifica se a regiao e o valor da primeira posicao equivale aos valores recebidos por parâmetro, se sim, quer dizer que já há um valor semelhante em tal posição da mesma regiao, retornando falso, do contrário, continua a verificação para as próximas posições, invocando o método verificarLinhaRegiao
--}
verificarRegiao :: [[(Int,Int,Int,Int)]] -> Int -> Int -> Bool
verificarRegiao [] _ _ = True
verificarRegiao (((x,y,r,v):t):l) reg val = 
    if (reg == r) then
        if (val == v) then
            False
        else
            (verificarLinhaRegiao t reg val) && verificarRegiao l reg val
    else
        (verificarLinhaRegiao t reg val) && verificarRegiao l reg val

{--
Esta função recebe uma lista te tuplas correspondente a linha da posicao que esta sendo analisada, a regiao de uma posicao e o valor dela que deseja-se verificar,
Realiza o mesmo procedimento do método acima, porém para uma única linha.
--}
verificarLinhaRegiao :: [(Int,Int,Int,Int)] -> Int -> Int -> Bool
verificarLinhaRegiao [] _ _ = True
verificarLinhaRegiao ((x,y,r,v):t) reg val = 
    if (reg == r) then
        if (val == v) then
            False
        else
            (verificarLinhaRegiao t reg val)
    else
        (verificarLinhaRegiao t reg val)
