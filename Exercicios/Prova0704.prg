// Gabriel Henrique Cavalin Bruno

set date brit 
set epoch to 1930
set century on
set message to 24
set wrap on

clear 

// Variaveis

dAtual           := Date()
nOpcao           := 0

nOrdemServico    := 1
cNomeCliente     := Space(40)
dOrdemServico    := Ctod('')
cNomeTecnico     := Space(30)
cDescEquipamento := Space(40)
dCompra          := dAtual
cEntregar        := Space(1)
nLimiteCompra    := 0
cEndereco        := Space(40)
cBairro          := Space(35)
cReferencia      := Space(35)
cTelefone        := Space(11)

// Processamento

@ 00,00 to 22,75 double

do while .t.

    @ 01,01 clear to 21,59

    cUsuario := Space(5)
    cSenha   := Space(8)

    @ 02,15 say "Tela de Login"
    @ 03,02 say "Usuario:"
    @ 04,02 say "Senha..:"
    
    @ 03,11 get cUsuario valid !Empty(cUsuario)
    @ 04,11 get cSenha   valid !Empty(cSenha)
    read

    if LastKey() == 27
        nOpcao := Alert('Menu de Opcoes', {'Sair', 'Continuar'})
        if nOpcao = 2 .or. nOpcao = 0
            loop
        else
            exit
        endif
    endif

    if cUsuario $ "ADMIN" .and. cSenha $ "123mudar"
        @ 01,01 clear to 21,59

        @ 02,02 prompt "Efetuar pedidos" message "Efetuar o pedido"
        @ 03,02 prompt "Sair"            message "Sair do programa"
        menu to nOpcao

        if nOpcao = 1
            // Opcao 1 - Efetuar pedidos
            @ 01,01 clear to 21,59

            @ 02,15 say "Pedido"
            @ 04,02 say "Nome do cliente.........:"
            @ 05,02 say "Data do Servico.........:"
            @ 06,02 say "Nome do Tecnico.........:"
            @ 07,02 say "Descricao do equipamento:"
            @ 08,02 say "Data da Compra..........:"
            @ 09,02 say "Entregar [S]im - [N]ao .:"
            @ 10,02 say "Limite de Credito.......:"

            @ 04,28 get cNomeCliente     picture "@!"       valid !Empty(cNomeCliente)
            @ 05,28 get dOrdemServico                       valid dOrdemServico <= dAtual
            @ 06,28 get cNomeTecnico     picture "@!"       valid !Empty(cNomeTecnico)
            @ 07,28 get cDescEquipamento picture "@!"       valid !Empty(cDescEquipamento)
            @ 08,28 get dCompra                             valid dCompra <= dAtual
            @ 09,28 get cEntregar        picture "@!"       valid cEntregar == 'S' .or. cEntregar == 'N'
            @ 10,28 get nLimiteCompra    picture "99999.99" valid nLimiteCompra >= 80 .and. nLimiteCompra <= 10000
            read 

            @ 12,02 prompt "Produto" message "Adicionar um Produto"
            @ 13,02 prompt "Servico" message "Adicionar um Servico"
            menu to nOpcao

            nValorOrdemServico     := 0
            nLinha          := 06
            lProdutoEstorou := .f.
            lServicoEstorou := .f.

            @ 01,01 clear to 21,59
            
            if nOpcao = 1
                //Produto
                do while .t.
                    cDescProduto      := Space(30)
                    nQuatidadeProduto := 0
                    nPrecoProduto     := 0
                    nDescontoProduto  := 0
                    
                    @ 02,15 say "Adicionando um Produto"
                    @ 04,02 say "Descricao"
                    @ 04,13 say "Quantidade"
                    @ 04,25 say "Preco Unitario"
                    @ 04,41 say "Desconto"
                    @ 04,51 say "Valor Final"

                    @ nLinha,03 get cDescProduto      picture "@!"               valid !Empty(cDescProduto)
                    @ nLinha,14 get nQuatidadeProduto picture "999"              valid nQuatidadeProduto > 0 .and. nQuatidadeProduto <= 100
                    @ nLinha,26 get nPrecoProduto     picture "@E 99 999 999.99" valid nPrecoProduto > 80 .and. nPrecoProduto <= 100000
                    @ nLinha,42 get nDescontoProduto  picture "@E 99.99"         valid nDescontoProduto >= 0 .and. nDescontoProduto <= 99.9
                    read

                    if LastKey() == 27
                        nOpcao := Alert('Deseja Finalizar a Ordem de Servico', {'Sim', 'Nao'})
                        if nOpcao = 1
                            exit
                        endif
                    endif

                    nPrecoProduto -= (nPrecoProduto * (nDescontoProduto)/100)

                    nValorTotalProduto := nPrecoUnitario * nQuatidadeProduto

                    @ nLinha,52 say Transform(nValorTotalProduto, "@E 99 999 999.99")

                    nValorOrdemServico += nValorTotalProduto

                    if nValorOrdemServico > nLimiteCompra
                        lProdutoEstorou := .t.
                        exit
                    endif

                    @ 12,02 say "Valor Total Ordem de Servico: " + Transform(nValorOrdemServico, "@E 99 999 999.99")

                    if nLinha == 10
                        nLinha := 06
                        @ 06,01 clear to 21,59
                    else
                        nLinha += 2
                    endif
                enddo
            else
                //Servico
                do while .t.
                    cDescServico      := Space(25)
                    nValorServico     := 0
                    nDescontoServico  := 0
                    nComissaoTecnico  := 0
                
                    @ 02,15 say "Adicionando um Servico"
                    @ 04,02 say "Descricao"
                    @ 04,13 say "Valor"
                    @ 04,20 say "Desconto"
                    @ 04,30 say "Comissao_Tecnico"
                    @ 04,48 say "Valor Final"

                    @ nLinha,03 get cDescServico     picture "@!"               valid !Empty(cDescServico)
                    @ nLinha,26 get nValorServico    picture "@E 99 999 999.99" valid nValorServico > 80 .and. nValorServico <= 100000
                    @ nLinha,42 get nDescontoServico picture "@E 99.99"         valid nDescontoServico >= 0 .and. nDescontoServico <= 99.9
                    @ nLinha,42 get nComissaoTecnico picture "@E 99.99"         valid nComissaoTecnico >= 0 .and. nComissaoTecnico <= 99.9
                    read

                    if LastKey() == 27
                        nOpcao := Alert('Deseja Finalizar a Ordem de Servico', {'Sim', 'Nao'})
                        if nOpcao = 1
                            exit
                        endif
                    endif

                    nValorServico -= (nValorServico * (nDescontoServico)/100)

                    nValorTotalServico := nValorServico

                    @ nLinha,49 say Transform(nValorTotalServico, "@E 99 999 999.99")

                    nValorOrdemServico += nValorTotalServico

                    if nValorOrdemServico > nLimiteCompra
                        lServicoEstorou := .t.
                        exit
                    endif

                    @ 12,02 say "Valor Total Ordem de Servico: " + Transform(nValorOrdemServico, "@E 99 999 999.99")

                    if nLinha == 10
                        nLinha := 6
                        @ 06,01 clear to 21,59
                    else
                        nLinha += 2
                    endif
                enddo
            endif

            if nValorOrdemServico > nLimiteCompra
                // Limite de Compra Estourado
                cSupervisor      := Space(15)
                cSenhaSupervisor := Space(12)

                Alert("Limite de Compra Estourado - Chamar Supervisor!")
                Inkey(3)

                @ 14,02 say "Supervisor:"
                @ 15,02 say "Senha.....:"

                @ 14,14 get cSupervisor      picture "@!" valid !Empty(cSupervisor)
                @ 15,14 get cSenhaSupervisor picture "@!" valid !Empty(cSenhaSupervisor)

                if !(cSenhaSupervisor $ "123LIBERA")
                    if lProdutoEstorou == .t.
                        //Desconsidera o ultimo Produto
                        nValorOrdemServico -= nValorTotalProduto
                    endif

                    if lServicoEstorou == .t.
                        //Desconsidera o ultimo Servico
                        nValorOrdemServico -= nValorTotalServico
                    endif
                endif
                @ 14,01 clear to 15,35
            endif

            //Entrega

            if cEntregar == 'S'
                @ 12,15 say "Dados da Entrega"

                @ 14,02 say "Endereco................:"
                @ 15,02 say "Bairro..................:"
                @ 16,02 say "Referencia..............:"
                @ 17,02 say "Telefone................:"

                @ 14,28 get cEndereco   picture "@!" valid !Empty(cEndereco)
                @ 15,28 get cBairro     picture "@!" valid !Empty(cBairro)
                @ 16,28 get cReferencia picture "@!" valid !Empty(cReferencia)
                @ 17,28 get cTelefone   picture "@!" valid !Empty(cTelefone) .and. !(cTelefone $ "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
                
                nValorOrdemServico += (nValorOrdemServico * 0.03) 
            endif
            nOrdemServico++
        else
            exit
        endif
    else
        // Opcao 2 - Sair
        Alert("Usuario ou senha incorretos!")
        loop
    endif
    exit
enddo

//Fechamento da venda

@ 03,01 clear to 21,59

nResto    := nValorOrdemServico
nPagar    := 0
lDinheiro := .f.
lCheque   := .f.
lCartao   := .f.

@ 02,15 say "Pagamento"

@ 04,02 say "O valor total do Orcamento e: " + Transform(nValorOrdemServico, "@E 99 999 999.99")

do while nResto > nValorOrdemServico
    @ 06,02 say "Digite a forma de pagamento:"

    @ 07,02 prompt "Dinheiro"
    @ 07,02 prompt "Cheque"
    @ 07,02 prompt "Cartao"
    menu to nOpcao

    @ 10,02 say "Digite quanto deseja pagar:"
    @ 10,30 get nPagar picture "@E 99 999 999.99" valid !Empty(nPagar)
    read

    if nOpcao = 1
        //Dinheiro
        if lDinheiro == .t.
            Alert("Forma de Pagamento DINHEIRO ja foi usada! Use outra forma de pagamento.")
        else
            nResto -= nPagar
            lDinheiro := .t.
        endif
    elseif nOpcao = 2
        //Cheque
        if lCheque == .t.
            Alert("Forma de Pagamento CHEQUE ja foi usada! Use outra forma de pagamento.")
        else
            nResto -= nPagar
            lCheque := .t.
        endif
    else
        //Cartao
        if lCartao == .t.
            Alert("Forma de Pagamento CARTAO ja foi usada! Use outra forma de pagamento.")
        else
            nResto -= nPagar
            lCartao := .t.
        endif
    endif
enddo

@ 20,02 say ""

Inkey(0)