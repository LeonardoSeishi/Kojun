module Main (main) where

import IndiceMatriz, ChecarAcimaAbaixo

{--[
[0,0,4,0,2,0],
[0,0,3,0,0,0],
[1,4,0,4,0,0],
[0,5,0,0,0,2],
[0,0,0,0,3,0],
[6,2,0,2,0,5]]

[[(0,0),(1,0),(2,0),(2,1)],
[(0,1),(0,2),(0,3),(1,2)],
[(0,4),(1,3),(1,4),(1,5),(2,3)],
[(0,5)],
[(1,1)],
[(2,2),(3,2)],
[(2,4),(2,5),(3,5),(4,5)],
[(3,0),(4,0)],
[(3,1),(4,1),(4,2),(5,0),(5,1),(5,2)],
[(3,3),(3,4)],
[(4,3),(4,4),(5,3),(5,4),(5,5)]]--}

--(x,y,r,v)  x = linha  y = coluna  r = regiao  v = valor

formatar :: [[(Int,Int,Int,Int)]] -> String
formatar [] = ""
formatar (((x,y,r,v):t):l) = (show v) ++ " " ++ (formatarLinha t) ++ (formatar l)
--l = resto das listas  t = outras tuplas  a = tupla atual

formatarLinha :: [(Int,Int,Int,Int)] -> String
formatarLinha [] = "\n"
formatarLinha ((x,y,r,v):t) = (show v) ++ " " ++ (formatarLinha t)


 
atualizarTuplas ::


resolver :: [[(Int,Int,Int,Int)]] ->



main = do
        let tabuleiro = [
                        [(0,0,0,0),(0,1,1,0),(0,2,1,4),(0,3,1, 0),(0,4,2, 2),(0,5,3, 0)],
                        [(1,0,0,0),(1,1,4,0),(1,2,1,3),(1,3,2, 0),(1,4,2, 0),(1,5,2, 0)],
                        [(2,0,0,1),(2,1,0,4),(2,2,5,0),(2,3,2, 4),(2,4,6, 0),(2,5,6, 0)],
                        [(3,0,7,0),(3,1,8,5),(3,2,5,0),(3,3,9, 0),(3,4,9, 0),(3,5,6, 2)],
                        [(4,0,7,0),(4,1,8,0),(4,2,8,0),(4,3,10,0),(4,4,10,3),(4,5,6, 0)],
                        [(5,0,8,6),(5,1,8,2),(5,2,8,0),(5,3,10,2),(5,4,10,0),(5,5,10,5)]]

        putStr (formatar tabuleiro)


