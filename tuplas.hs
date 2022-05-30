module Tuplas (alterarTupla) where

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
