module ChecarRegiao (verificarRegiao) where



verificarRegiao :: [[(Int,Int,Int,Int)]] -> Int -> Int -> Bool
verificarRegiao [] _ _ = True
verificarRegiao (((x,y,r,v):t):l) val reg = 
    if (reg == r) then
        if (val == v) then
            False
        else
            (verificarLinhaRegiao t val reg) && verificarRegiao l val reg
    else
        (verificarLinhaRegiao t val reg) && verificarRegiao l val reg
  
verificarLinhaRegiao :: [(Int,Int,Int,Int)] -> Int -> Int -> Bool
{--verificarLinha [] = "\n"--}
verificarLinhaRegiao [] _ _ = True
verificarLinhaRegiao ((x,y,r,v):t) val reg = 
    if (reg == r) then
        if (val == v) then
            False
        else
            (verificarLinhaRegiao t val reg)
    else
        (verificarLinhaRegiao t val reg)
