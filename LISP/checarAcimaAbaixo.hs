module ChecarAcimaAbaixo (verificarAcimaAbaixo, checarAcimaMaior, checarAbaixoMenor) where

import Matriz


--função responsável por retornar se é possível colocar o valor passado na posição
--com os 2 critérios das outras funções abaixo
verificarAcimaAbaixo :: [[(Int,Int,Int,Int)]] -> Int -> Int -> Int -> Int -> Bool
verificarAcimaAbaixo mat lin col reg val = (checarAcimaMaior mat lin col reg val)  && (checarAbaixoMenor mat lin col reg val)
--mat = matriz| lin = linha| col = coluna| reg = regiao| val = valor


--checa se o valor acima é da mesma região e é maior que valor passado
checarAcimaMaior :: [[(Int,Int,Int,Int)]] -> Int -> Int -> Int -> Int -> Bool
checarAcimaMaior mat lin col reg val = 
    if ((getRegLinha mat (lin-1) col) == reg) then --testa se a posição da linha acima é da mesma região
        if ((getPosLinha mat (lin-1) col) > val || (getPosLinha mat (lin-1) col) == 0) then --testa se o valor acima é maior ou igual 0
            True
        else
            False
    else
        True

--a mesma regra da função acima porém checando a posição da linha debaixo
checarAbaixoMenor :: [[(Int,Int,Int,Int)]] -> Int -> Int -> Int -> Int -> Bool
checarAbaixoMenor mat lin col reg val = 
    if ((getRegLinha mat (lin+1) col) == reg) then
        if ((getPosLinha mat (lin+1) col) < val) then
            True
        else
            False
    else
        True

