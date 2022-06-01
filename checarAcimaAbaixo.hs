module ChecarAcimaAbaixo (verificarAcimaAbaixo, checarAcimaMaior, checarAbaixoMenor) where

import Matriz


--mat = matriz| lin = linha| col = coluna| reg = regiao| val = valor
verificarAcimaAbaixo :: [[(Int,Int,Int,Int)]] -> Int -> Int -> Int -> Int -> Bool
verificarAcimaAbaixo mat lin col reg val = (checarAcimaMaior mat lin col reg val)  && (checarAbaixoMenor mat lin col reg val)

checarAcimaMaior :: [[(Int,Int,Int,Int)]] -> Int -> Int -> Int -> Int -> Bool
checarAcimaMaior mat lin col reg val = 
    if ((getRegLinha mat (lin-1) col) == reg) then
        if ((getPosLinha mat (lin-1) col) > val || (getPosLinha mat (lin-1) col) == 0) then
            True
        else
            False
    else
        True

checarAbaixoMenor :: [[(Int,Int,Int,Int)]] -> Int -> Int -> Int -> Int -> Bool
checarAbaixoMenor mat lin col reg val = 
    if ((getRegLinha mat (lin+1) col) == reg) then
        if ((getPosLinha mat (lin+1) col) < val) then
            True
        else
            False
    else
        True

