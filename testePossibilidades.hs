module TestePossibilidades (resolverTabuleiro) where

import ChecarAcimaAbaixo
import ChecarRegiao
import ChecarAdjacente


resolverTabuleiro :: [[(Int,Int,Int,Int)]] -> [[(Int,Int,Int,Int)]] -> [[Int]]
resolverTabuleiro _ [] = []
resolverTabuleiro mat (l1:l) = (resolverTabuleiroLinha mat l1) ++ (resolverTabuleiro mat l)


resolverTabuleiroLinha :: [[(Int,Int,Int,Int)]] -> [(Int,Int,Int,Int)] -> [[Int]]
resolverTabuleiroLinha _ [] = []
resolverTabuleiroLinha mat ((x,y,r,v):t) | v == 0 = (testarValores mat (x,y,r,v) (getTamanhoRegiao mat r)) : (resolverTabuleiroLinha mat t)
                                         | otherwise = resolverTabuleiroLinha mat t


testarValores :: [[(Int,Int,Int,Int)]] -> (Int,Int,Int,Int) ->  Int -> [Int]
testarValores mat (x,y,r,v) teste = 
    if (teste > 0) then 
        if (verificarAcimaAbaixo mat x y r teste) && (verificarRegiao mat r teste) && (checarAdjacente mat x y teste) then
            [teste] ++ (testarValores mat (x,y,r,v) (teste -1) )
        else
            (testarValores mat (x,y,r,v) (teste- 1) )
    else
        []

            
getTamanhoRegiao :: [[(Int,Int,Int,Int)]] -> Int -> Int
getTamanhoRegiao [] _ = 0
getTamanhoRegiao (((_,_,r,_):t):l) reg | reg == r = 1 + (getTamanhoRegiaoLinha t reg) + (getTamanhoRegiao l reg)
                                       | otherwise = (getTamanhoRegiaoLinha t reg) + (getTamanhoRegiao l reg)

getTamanhoRegiaoLinha :: [(Int,Int,Int,Int)] -> Int -> Int
getTamanhoRegiaoLinha [] _ = 0
getTamanhoRegiaoLinha ((_,_,r,_):t) reg | reg == r = 1 + (getTamanhoRegiaoLinha t reg)
                                        | otherwise = (getTamanhoRegiaoLinha t reg)
