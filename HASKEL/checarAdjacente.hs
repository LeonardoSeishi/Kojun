module ChecarAdjacente (checarAdjacente) where

import Matriz

{-- Esta função recebe uma posição e um valor para avaliar,
    Checa se a posição acima é de outra regiao e possui o mesmo valor, se sim retorna True
    Caso contrario retorna False 
--}
avaliarVizinhosLinhaCima::[[(Int,Int,Int,Int)]] -> Int -> Int -> Int -> Bool
avaliarVizinhosLinhaCima tabuleiro linha coluna val =
    if (getRegLinha tabuleiro linha coluna) == (getRegLinha tabuleiro (linha-1) coluna) then
        True
    else
        if (getPosLinha tabuleiro (linha-1) coluna) == val then
            False
        else
            True

{-- Esta função recebe uma posição e um valor para avaliar,
    Checa se a posição a baixo é de outra regiao e possui o mesmo valor, se sim retorna True
    Caso contrario retorna False 
--}
avaliarVizinhosLinhaBaixo::[[(Int,Int,Int,Int)]] -> Int -> Int -> Int -> Bool
avaliarVizinhosLinhaBaixo tabuleiro linha coluna val =
        if (getRegLinha tabuleiro linha coluna) == (getRegLinha tabuleiro (linha+1) coluna) then
            True
        else
            if (getPosLinha tabuleiro (linha+1) coluna) == val then
                False
            else
                True

{-- Esta função recebe uma posição e um valor para avaliar,
    Checa se a posição a esquerda é de outra regiao e possui o mesmo valor, se sim retorna True
    Caso contrario retorna False 
--}
avaliarVizinhosColunaEsq::[[(Int,Int,Int,Int)]] -> Int -> Int -> Int -> Bool
avaliarVizinhosColunaEsq tabuleiro linha coluna val=
    if (getRegLinha tabuleiro linha coluna) == (getRegLinha tabuleiro linha (coluna - 1) ) then
        True
    else
        if ((getPosLinha tabuleiro linha (coluna-1)) == val) then
            False
        else
            True

{-- Esta função recebe uma posição e um valor para avaliar,
    Checa se a posição a direita é de outra regiao e possui o mesmo valor, se sim retorna True
    Caso contrario retorna False 
--}
avaliarVizinhosColunaDir::[[(Int,Int,Int,Int)]] ->Int -> Int -> Int -> Bool
avaliarVizinhosColunaDir tabuleiro linha coluna val =
        if (getRegLinha tabuleiro linha coluna) == (getRegLinha tabuleiro linha (coluna + 1) ) then
            True
        else
            if ((getPosLinha tabuleiro linha (coluna+1)) == val) then
                False
            else
                True

{-- Esta função recebe uma posição e um valor para avaliar,
    Chama todas as funções para avaliar as posições acima, a baixo, a direita e a esquerda
    Se todas retornarem True ela retorna True
    Caso contrario retorna False 
--}
checarAdjacente::[[(Int,Int,Int,Int)]] ->Int -> Int -> Int -> Bool
checarAdjacente tabuleiro linha coluna val =
    (avaliarVizinhosColunaDir tabuleiro linha coluna val) &&(avaliarVizinhosColunaEsq tabuleiro linha coluna val) && (avaliarVizinhosLinhaCima tabuleiro linha coluna val) &&(avaliarVizinhosLinhaBaixo tabuleiro linha coluna val)
