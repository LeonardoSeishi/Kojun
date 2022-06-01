module TestePossibilidades (resolverTabuleiro, testarValores) where

import ChecarAcimaAbaixo
import ChecarRegiao
import ChecarAdjacente
import Matriz


resolverTabuleiro :: [[(Int,Int,Int,Int)]]-> [[(Int,Int,Int,Int)]]
resolverTabuleiro (l1:l) = resolverTabuleiroLinha (l1:l) l l1

resolverTabuleiroLinha :: [[(Int,Int,Int,Int)]] -> [[(Int,Int,Int,Int)]] -> [(Int,Int,Int,Int)] -> [[(Int,Int,Int,Int)]]
resolverTabuleiroLinha mat [] [] = mat
resolverTabuleiroLinha mat (l1:l) [] = resolverTabuleiroLinha mat l l1
resolverTabuleiroLinha mat l ((x,y,r,v):t) =
    if v == 0 then
        for mat l t (x,y,r,v) (testarValores mat (x,y,r,v) (getTamanhoRegiao mat r))
    else
        resolverTabuleiroLinha mat l t


for :: [[(Int,Int,Int,Int)]] -> [[(Int,Int,Int,Int)]] -> [(Int,Int,Int,Int)] -> (Int,Int,Int,Int) -> [Int] -> [[(Int,Int,Int,Int)]]
for _ _ _ _ [] = []
for mat l t (x,y,r,v) (valor:valores) = do
    next_mat <- resolverTabuleiroLinha (alterarTupla mat x y valor) l t
    if next_mat == [] then 
        for mat l t (x,y,r,v) valores
    else
        return next_mat

testarValores :: [[(Int,Int,Int,Int)]] -> (Int,Int,Int,Int) ->  Int -> [Int]
testarValores mat (x,y,r,v) teste = 
    if (teste > 0) then 
        if (verificarAcimaAbaixo mat x y r teste) && (verificarRegiao mat r teste) && (checarAdjacente mat x y teste) then
            [teste] ++ (testarValores mat (x,y,r,v) (teste -1) )
        else
            (testarValores mat (x,y,r,v) (teste- 1) )
    else
        []
            
