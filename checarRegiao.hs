module ChecarRegiao (verificarRegiao) where



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
  
verificarLinhaRegiao :: [(Int,Int,Int,Int)] -> Int -> Int -> Bool
{--verificarLinha [] = "\n"--}
verificarLinhaRegiao [] _ _ = True
verificarLinhaRegiao ((x,y,r,v):t) reg val = 
    if (reg == r) then
        if (val == v) then
            False
        else
            (verificarLinhaRegiao t reg val)
    else
        (verificarLinhaRegiao t reg val)
