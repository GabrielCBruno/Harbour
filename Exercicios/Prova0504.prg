// Gabriel Henrique Cavalin Bruno

set date brit 
set epoch to 1930
set century on
set message to 16
set wrap on

clear 

// Variaveis

dAtual             := Date()
nOpcao             := 0
nNumPedido         := 1
nValorTotalCompra  := 0

nEstoqueGeralAmora   := 110
nEstoqueGeralUva     := 198.5
nEstoqueGeralPepino  := 445
nEstoqueGeralMorango := 200

// Processamento

@ 00,00 to 22,61 double

do while .t.

    @ 03,01 clear to 21,59

    @ 02,14 say "Frutaria Gabriel"
    @ 03,15 say "Tela de Login"
    @ 05,02 prompt "Cadastrar" message "Cadastrar um novo Usuario" 
    @ 06,02 prompt "Entrar"    message "Entrar com um usuario"
    @ 07,02 prompt "Sair"      message "Encerrar a aplicacao"
    menu to nOpcao

    @ 03,01 clear to 09,59
     
    if nOpcao = 1
        
    elseif nOpcao = 2

        cUsuario := Space(7)
        cSenha   := Space(7)

        @ 04,02 say "Usuario:"
        @ 05,02 say "Senha..:"

        @ 04,11 get cUsuario valid !Empty(cUsuario)
        @ 05,11 get cSenha   valid !Empty(cSenha)
        read

        if cUsuario $ "Roberto" .and. cSenha $ "1234567"
            do while .t.
                @ 03,01 clear to 09,59

                @ 03,15 say "Menu de Opcoes"
                @ 05,02 prompt "Efetuar Pedidos" message "Efetuar pedidos"
                @ 06,02 prompt "Sair"            message "Voltar para o menu anterior"
                menu to nOpcao

                if nOpcao = 1
                    @ 03,01 clear to 21,59

                    cNomeCliente   := Space(25)
                    nLimiteCredito := 0
                    dPedido        := dAtual

                    @ 03,15 say "Efetuar Pedidos"
                    @ 05,02 say "Numero do Pedido.: " + AllTrim(Str(nNumPedido))
                    @ 06,02 say "Nome do Cliente..: "
                    @ 07,02 say "Limite de Credito: "
                    @ 08,02 say "Data do Pedido...: "
                    
                    @ 06,21 get cNomeCliente   picture "@!"       valid !Empty(cNomeCliente)
                    @ 07,21 get nLimiteCredito picture "99999.99" valid nLimiteCredito >= 1000
                    @ 08,21 get dPedido                           valid Year(dPedido) > 1950
                    read

                    if LastKey() == 27
                        nOpcao := Alert('Menu de Opcoes', {'Sair', 'Continuar'})
                        if nOpcao = 2 .or. nOpcao = 0
                            loop
                        else
                            exit
                        endif
                    endif

                    do while .t.
                        @ 03,01 clear to 21,59
                        nQuantidadeCompra := 0
                        nDesconto         := 0
                        nTotal            := 0
                        nCodigo := 0

                        nCodigoProduto    := 0
                        cDescricaoProduto := ""
                        nPrecoProduto     := 0
                        nDescontoProduto  := 0
                        nEstoqueProduto   := 0
                        

                        @ 10,02 say "Digite o codigo do produto que deseja comprar:"
                        @ 10,49 get nCodigo picture "9999" valid !Empty(nCodigo)
                        read
                        
                        if LastKey() == 27
                            nOpcao := Alert('Menu de Opcoes', {'Sair', 'Finalizar a Compra'})
                            if nOpcao = 1
                                @ 03,01 clear to 21,59
                                exit
                            else
                                if nOpcao = 2
                                    @ 03,01 clear to 21,59
                                    exit
                                endif
                            endif
                        endif

                        @ 03,01 clear to 21,59

                        if nCodigo = 5500
                            nCodigoProduto = nCodigo
                            cDescricaoProduto := "Amora preta"
                            nPrecoProduto     := 1.50
                            nDescontoProduto  := 12
                            nEstoqueProduto   := nEstoqueGeralAmora

                        elseif nCodigo = 7744
                            nCodigoProduto = nCodigo
                            cDescricaoProduto := "Uva Rubi"
                            nPrecoProduto     := 8
                            nDescontoProduto  := 11
                            nEstoqueProduto   := nEstoqueGeralUva

                        elseif nCodigo = 4445
                            nCodigoProduto = nCodigo
                            cDescricaoProduto := "Pepino"
                            nPrecoProduto     := 3.99
                            nDescontoProduto  := 2
                            nEstoqueProduto   := nEstoqueGeralPepino

                        elseif nCodigo = 6565
                            nCodigoProduto = nCodigo
                            cDescricaoProduto := "Morango"
                            nPrecoProduto     := 15.59
                            nDescontoProduto  := 6
                            nEstoqueProduto   := nEstoqueGeralMorango
                        else
                            Alert("O codigo digitado nao existe")
                            exit
                        endif
                        @ 03,02 say "Codigo.......................: " + AllTrim(Str(nCodigoProduto))
                        @ 04,02 say "Descricao....................: " + AllTrim(cDescricaoProduto)
                        @ 05,02 say "Preco Unitario...............: " + Transform(nPrecoProduto, "@E 99.99")
                        @ 06,02 say "Percentual de Desconto.......: "
                        @ 07,02 say "Quantidade no Estoque........: " + Transform(nEstoqueProduto, "@E 999.99")
                        @ 08,02 say "Quantidade que deseja Comprar: "

                        @ 06,33 get nDesconto         picture "999" valid nDesconto >= 0 .and. nDesconto <= 100
                        @ 08,33 get nQuantidadeCompra picture "999" valid nQuantidadeCompra > 0 .and. nQuantidadeCompra <= 200
                        read

                        if nDesconto <= nDescontoProduto
                            nPrecoProduto -= (nPrecoProduto * nDesconto/100)
                        else
                            Alert("O desconto digitado e maior que o permitido!")
                            loop
                        endif

                        if nQuantidadeCompra <= nEstoqueProduto
                            nTotal := nPrecoProduto * nQuantidadeCompra
                            if nTotal <= nLimiteCredito
                                //Compra Realizada
                                nLimiteCredito -= nTotal
                                nValorTotalCompra += nTotal
                            else    
                                Alert("Limite insuficiente para realizar a compra")
                                loop
                            endif
                        else
                            Alert("O quantidade digitado e maior que o estoque!")
                            loop
                        endif

                        @ 10,02 say "Total da Compra: " + Transform(nTotal, "@E 999999.99")
                        @ 11,02 say "Total Geral....: " + Transform(nValorTotalCompra, "@E 999999.99")
                        @ 13,20 say "Compra Realizada com Sucesso!" color "g/n"
                        InKey(0)
                        nNumPedido++
                    enddo
                    if nOpcao = 2
                        exit
                    endif
                else
                    exit
                endif
            enddo
        else
            Alert("Usuario ou senha incorretos!")
            loop
        endif
    else
        exit
    endif
enddo
@ 03,01 clear to 21,59

@ 10,02 say "Total Geral: " + Transform(nValorTotalCompra, "@E 999999.99")

@ 20,02 say ""

Inkey(0)