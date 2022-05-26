module IndiceMatriz (getRegColuna, getRegLinha, getPosColuna, getPosLinha) where


--percorre as linhas e depois as colunas ate achar a linha  e coluna desejada e retorna a regiao
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
