module Matriz (getRegLinha, getPosLinha, alterarTupla, getTamanhoRegiao) where


{-- as quatro funções abaixo simulam uma chamada de dados da lista por indices
 ex.: valor = matriz[x][y]
sendo que as duas primeiras são responsáveis por retornar o número da região
e os outros dois retornam o valor na posição  --}

--percorre todas as linhas até achar a linha do indice
getRegLinha :: [[(Int,Int,Int,Int)]] -> Int -> Int -> Int
getRegLinha [] _ _= -1
getRegLinha (a:e) linha coluna |linha == 0 = getRegColuna a coluna
                               |otherwise = (getRegLinha e (linha-1) coluna)

{--função de suporte para procurar a coluna desejada a partir da linha que ja 
   foi encontrada pela função anterior e retorna a regiao--}
getRegColuna :: [(Int,Int,Int,Int)] -> Int -> Int
getRegColuna [] _ = -1
getRegColuna ((a,b,c,d):e) coluna |coluna == 0 = c
                                  |otherwise = (getRegColuna e (coluna - 1) )

--a mesma logica acima se aplica a essas outras duas funções, porem retorna o valor desta posicao
getPosLinha :: [[(Int,Int,Int,Int)]] -> Int -> Int -> Int
getPosLinha [] _ _ = -1
getPosLinha (a:e) linha coluna |linha == 0 = getPosColuna a coluna
                               |otherwise = (getPosLinha e (linha-1) coluna)

getPosColuna :: [(Int,Int,Int,Int)] -> Int -> Int
getPosColuna [] _ = -1
getPosColuna ((a,b,c,d):e) coluna |coluna == 0 = d
                                  |otherwise = (getPosColuna e (coluna - 1) )


{-- altera alguma tupla dentro da matriz com o novo VALOR, o resto continua igual--}
alterarTupla :: [[(Int, Int, Int, Int)]] -> Int -> Int -> Int -> [[(Int, Int, Int, Int)]]
alterarTupla [] _ _ _ = []
alterarTupla (a:l) linha coluna new_value
    |linha == 0 = alterarTuplaLinha a coluna new_value : l
    |otherwise = a : alterarTupla l (linha-1) coluna new_value

alterarTuplaLinha :: [(Int, Int, Int, Int)] -> Int -> Int -> [(Int, Int, Int, Int)]
alterarTuplaLinha [] _ _ = []
alterarTuplaLinha ((x, y, r, v):t) coluna new_value
    |coluna == 0 = (x,y,r,new_value) : t
    |otherwise = (x,y,r,v) : alterarTuplaLinha t (coluna-1) new_value



{-- função auxiliar que soma o número de posições que se tem uma região desejada--}
getTamanhoRegiao :: [[(Int,Int,Int,Int)]] -> Int -> Int
getTamanhoRegiao [] _ = 0
getTamanhoRegiao (((_,_,r,_):t):l) reg | reg == r = 1 + (getTamanhoRegiaoLinha t reg) + (getTamanhoRegiao l reg)
                                       | otherwise = (getTamanhoRegiaoLinha t reg) + (getTamanhoRegiao l reg)

getTamanhoRegiaoLinha :: [(Int,Int,Int,Int)] -> Int -> Int
getTamanhoRegiaoLinha [] _ = 0
getTamanhoRegiaoLinha ((_,_,r,_):t) reg | reg == r = 1 + (getTamanhoRegiaoLinha t reg)
                                        | otherwise = (getTamanhoRegiaoLinha t reg)
