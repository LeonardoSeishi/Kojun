module TestePossibilidades (resolverTabuleiro, testarValores) where

import ChecarAcimaAbaixo    --regra dos valores acima ter que ser maior que o debaixo dentro de uma mesma regiao
import ChecarRegiao         --regra em que o numero dentro de uma região não pode repetir
import ChecarAdjacente      --regra em que numero adjacentes não podem ser iguais
import Matriz               --arquivo que ajuda na manipulação de matrizes (retorna matrizes modificadas, os dados em um indice e entre outros)


--metodo que pega a matriz inicial e repassa ela, a primeira linha e os restante das linhas
resolverTabuleiro :: [[(Int,Int,Int,Int)]]-> [[(Int,Int,Int,Int)]]
resolverTabuleiro (l1:l) = resolverTabuleiroLinha (l1:l) l l


{--Função principal que percorre toda a matriz enquanto a resolve

                             Matriz Atual            Resto das Linhas          Linha Atual            Matriz Resolvida    --}
resolverTabuleiroLinha :: [[(Int,Int,Int,Int)]] -> [[(Int,Int,Int,Int)]] -> [(Int,Int,Int,Int)] -> [[(Int,Int,Int,Int)]]
resolverTabuleiroLinha mat [] [] = mat --se percorrer toda matriz retornar a matriz que foi alterada até então
resolverTabuleiroLinha mat (l1:l) [] = resolverTabuleiroLinha mat l l1 --se a linha atual acabar, passar para a proxima linha
resolverTabuleiroLinha mat l ((x,y,r,v):t) = --parte principal
    if v == 0 then --verifica se a posição está vazia
        for mat l t (x,y,r,v) (testarValores mat (x,y,r,v) (getTamanhoRegiao mat r)) 
{--     irá mandar para o for os mesmos dados que ja estão nessa função mais uma lista de todos os valores (testarValores) possiveis
     para a posicao atual, e o for irá percorrer essa lista de valores possíveis testando modificando o matriz atual com valor testado--}
    else
        --caso a posicao não esteja vazia passar para a próxima posição
        resolverTabuleiroLinha mat l t

{-- função que garantirá o backtrecking, pois o mesmo é responsável por testar os valores possíveis e mudar a matriz com o novo valor
até que uma hora ele receba uma lista de valores possíveis vazia, retornando a lista vazia para verificar que ouve algum erro e testar
um novo valor até que ele consiga percorrer toda a matriz sem ocorrer nenhum erro
           matriz atual           resto das linhas       resto das posições       posição atual      lista de valores possiveis--}
for :: [[(Int,Int,Int,Int)]] -> [[(Int,Int,Int,Int)]] -> [(Int,Int,Int,Int)] -> (Int,Int,Int,Int) -> [Int] -> [[(Int,Int,Int,Int)]]
for _ _ _ _ [] = [] --caso ele receba uma lista valores possiveis vazia retornar uma lista vazia
for mat l t (x,y,r,v) (valor:valores) = do
    next_mat <- resolverTabuleiroLinha (alterarTupla mat x y valor) l t --chamar o resolver tabuleiro com a matriz modificada
    if next_mat == [] then --se foi retornado uma lista vazia, ele testará outro valor possivel
        for mat l t (x,y,r,v) valores
    else
        return next_mat --se nao ouve nenhum problema retornar a matriz modificada


{-- função resposável por pegar uma posição e testar todos valores possíveis que podem sem colocadas naquela posição
utilizando dos metódos que verificam as regras do jogo e retornam booleanos, caso passe por todas as regras, botar na lista que
será retornada--}
testarValores :: [[(Int,Int,Int,Int)]] -> (Int,Int,Int,Int) ->  Int -> [Int]
testarValores mat (x,y,r,v) teste = --o teste começa como o valor do tamanho da região e depois ele é subtraido para testar todos os números
    if (teste > 0) then 
        --teste das tres regras do jogo
        if (verificarAcimaAbaixo mat x y r teste) && (verificarRegiao mat r teste) && (checarAdjacente mat x y teste) then
            --se passar em todas regras, adcionar na lista de valores possiveis e depois testa o próximo numero
            [teste] ++ (testarValores mat (x,y,r,v) (teste -1) )
        else
            --caso não, apenas testa o próximo número
            (testarValores mat (x,y,r,v) (teste- 1) )
    else
        []
            
