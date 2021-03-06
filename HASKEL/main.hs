module Main (main) where

import TestePossibilidades


{--quase todas as funcionalidades desse programa possuem duas funções 
para garantir que ele passe por todas as linhas e colunas de uma matriz

* l1 = linha atual l = resto das listas  t = outras tuplas na mesma linha  (x,y,r,v) = tupla atual
* x = linha  y = coluna  r = regiao  v = valor
* mat = matriz inteira
--> VALE PARA QUASE TODOS AS FUNÇÕES DESSE PROGRAMA <--

matriz com os valores iniciais
[
[0,0,4,0,2,0],
[0,0,3,0,0,0],
[1,4,0,4,0,0],
[0,5,0,0,0,2],
[0,0,0,0,3,0],
[6,2,0,2,0,5]]

regioes da matriz e as posições dentro de cada regiao
[[(0,0),(1,0),(2,0),(2,1)],                     -0
[(0,1),(0,2),(0,3),(1,2)],                      -1
[(0,4),(1,3),(1,4),(1,5),(2,3)],                -2
[(0,5)],                                        -3
[(1,1)],                                        -4
[(2,2),(3,2)],                                  -5
[(2,4),(2,5),(3,5),(4,5)],                      -6
[(3,0),(4,0)],                                  -7
[(3,1),(4,1),(4,2),(5,0),(5,1),(5,2)],          -8
[(3,3),(3,4)],                                  -9
[(4,3),(4,4),(5,3),(5,4),(5,5)]]                -10
--}


--pega a matriz completa e transforma em uma string para o print aparecer apenas os valores
formatar :: [[(Int,Int,Int,Int)]] -> String
formatar [] = ""
formatar (((x,y,r,v):t):l) = (show v) ++ " " ++ (formatarLinha t) ++ (formatar l)


formatarLinha :: [(Int,Int,Int,Int)] -> String
formatarLinha [] = "\n"
formatarLinha ((x,y,r,v):t) = (show v) ++ " " ++ (formatarLinha t)


main = do
        let tabuleiro = [
                        [(0,0,0,0),(0,1,1,0),(0,2,1,4),(0,3,1, 0),(0,4,2, 2),(0,5,3, 0)],
                        [(1,0,0,0),(1,1,4,0),(1,2,1,3),(1,3,2, 0),(1,4,2, 0),(1,5,2, 0)],
                        [(2,0,0,1),(2,1,0,4),(2,2,5,0),(2,3,2, 4),(2,4,6, 0),(2,5,6, 0)],
                        [(3,0,7,0),(3,1,8,5),(3,2,5,0),(3,3,9, 0),(3,4,9, 0),(3,5,6, 2)],
                        [(4,0,7,0),(4,1,8,0),(4,2,8,0),(4,3,10,0),(4,4,10,3),(4,5,6, 0)],
                        [(5,0,8,6),(5,1,8,2),(5,2,8,0),(5,3,10,2),(5,4,10,0),(5,5,10,5)]]
        --esse tabuleiro é uma representação das matrizes de valores e as listas de regiões juntas

        putStr ("\nEntrada:\n")
        putStrLn (formatar tabuleiro)
        putStr ("Saída:\n")
        --aqui começa a resolver o puzzle, resolverTabuleiro( Teste Possibilidades )
        putStrLn (formatar (resolverTabuleiro tabuleiro))






