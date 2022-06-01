module ChecarAdjacente (checarAdjacente) where

import Matriz

avaliarVizinhosLinhaCima::[[(Int,Int,Int,Int)]] -> Int -> Int -> Int -> Bool
avaliarVizinhosLinhaCima tabuleiro linha coluna val =
    if (getRegLinha tabuleiro linha coluna) == (getRegLinha tabuleiro (linha-1) coluna) then
        True
    else
        if (getPosLinha tabuleiro (linha-1) coluna) == val then
            False
        else
            True

avaliarVizinhosLinhaBaixo::[[(Int,Int,Int,Int)]] -> Int -> Int -> Int -> Bool
avaliarVizinhosLinhaBaixo tabuleiro linha coluna val =
        if (getRegLinha tabuleiro linha coluna) == (getRegLinha tabuleiro (linha+1) coluna) then
            True
        else
            if (getPosLinha tabuleiro (linha+1) coluna) == val then
                False
            else
                True

avaliarVizinhosColunaEsq::[[(Int,Int,Int,Int)]] -> Int -> Int -> Int -> Bool
avaliarVizinhosColunaEsq tabuleiro linha coluna val=
    if (getRegLinha tabuleiro linha coluna) == (getRegLinha tabuleiro linha (coluna - 1) ) then
        True
    else
        if ((getPosLinha tabuleiro linha (coluna-1)) == val) then
            False
        else
            True

avaliarVizinhosColunaDir::[[(Int,Int,Int,Int)]] ->Int -> Int -> Int -> Bool
avaliarVizinhosColunaDir tabuleiro linha coluna val =
        if (getRegLinha tabuleiro linha coluna) == (getRegLinha tabuleiro linha (coluna + 1) ) then
            True
        else
            if ((getPosLinha tabuleiro linha (coluna+1)) == val) then
                False
            else
                True

checarAdjacente::[[(Int,Int,Int,Int)]] ->Int -> Int -> Int -> Bool
checarAdjacente tabuleiro linha coluna val =
    (avaliarVizinhosColunaDir tabuleiro linha coluna val) &&(avaliarVizinhosColunaEsq tabuleiro linha coluna val) && (avaliarVizinhosLinhaCima tabuleiro linha coluna val) &&(avaliarVizinhosLinhaBaixo tabuleiro linha coluna val)
