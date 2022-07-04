;Esta função recebe uma listas te tuplas correspondente ao tabuleiro, a região de uma posicao e o valor dela que deseja-se verificar.
;O algoritmo verifica se a regiao e o valor da primeira posicao equivale aos valores recebidos por parâmetro, se sim, quer dizer que já há um valor semelhante em tal posição da mesma regiao, retornando falso, do contrário, continua a verificação para as próximas posições, invocando o método verificarLinhaRegiao
(defun verificarRegiao(matriz reg val)
    (if (null matriz)
        T
        (if (= reg (car (cdr (cdr (car (car matriz))))))
            (if (= val (car (last (car (car matriz)))))
                NIL
                (and (verificarLinhaRegiao (cdr (car matriz)) reg val) (verificarRegiao (cdr matriz) reg val))
            )
            (and (verificarLinhaRegiao (cdr (car matriz)) reg val) (verificarRegiao (cdr matriz) reg val))
        )
    )
)

;Esta função recebe uma lista te tuplas correspondente a linha da posicao que esta sendo analisada, a regiao de uma posicao e o valor dela que deseja-se verificar,
;Realiza o mesmo procedimento do método acima, porém para uma única linha.
(defun verificarLinhaRegiao(linha reg val)
    (if (null linha)
        T
        (if (= reg (car (cdr (cdr (car linha)))))
            (if (= val (car (last (car linha))))
                NIL
                (verificarLinhaRegiao (cdr linha) reg val)
            )
            (verificarLinhaRegiao (cdr linha) reg val)
        )
    )
)