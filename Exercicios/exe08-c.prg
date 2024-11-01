set date brit
set epoch to 1940
set century on 

clear 

// Variaveis

cNome           := Space(25)
nIdade          := 0
cEndereco       := Space(35)
dAtual          := Date()
dCompra         := dAtual
dEntrega        := CTod('')
nTotalProduto   := 0
nTotalGeral     := 0
nLimite         := 0
cMensagemLimite := "O Valor do produto e maior que o limite disponivel"

// Processamento

do while .t.

    clear

    @ 01,01 to 10,71 double

    @ 03,25 say "Informacoes da Venda"
    @ 05,04 say "Nome..............: "
    @ 06,04 say "Idade.............: "
    @ 07,04 say "Data da Compra....: "
    @ 08,04 say "Limite da Compra..: "

    @ 05,24 get cNome    picture "@!"   valid !Empty(cNome)
    @ 06,24 get nIdade   picture "999"  valid !Empty(nIdade)  .and. nIdade > 18 .and. nIdade <= 120
    @ 07,24 get dCompra                 valid !Empty(dCompra) .and. dCompra <= dAtual
    @ 08,24 get nLimite  picture "9999" valid !Empty(nLimite) .and. nLimite > 0 .and. nLimite <= 5000   
    read

    if LastKey() = 27
        nOpcao := Alert('Sair do programa', {'Sim', 'Nao'})
        if nOpcao = 1
            exit
        else
            loop
        endif    
    endif

    @ 02,02 clear to 17,70 //Limpar Quadrado

    @ 03,25 say "Informacoes dos Itens"

    @ 05,04 say "SEQ"
    @ 05,16 say "PRODUTO"
    @ 05,35 say "QTD"
    @ 05,42 say "PRECO"
    @ 05,51 say "VALOR(R$)"

    //Produtos 

    @ 01,01 to 23,71 double

    nContador := 1

    do while .t.

        cNomeProduto    := Space(20)
        nQtdProduto     := 0
        nPrecoProduto   := 0

        @ 06,02 clear to 17,70

        @ 07,05 say AllTrim(Str(nContador))

        @ 07,10 get cNomeProduto   picture "@!"        valid !Empty(cNomeProduto)
        @ 07,33 get nQtdProduto    picture "@E 999.99" valid !Empty(nQtdProduto)   .and. nQtdProduto > 0 .and. nQtdProduto < 100
        @ 07,42 get nPrecoProduto  picture "@E 999.99" valid !Empty(nPrecoProduto) .and. nPrecoProduto > 0
        read

        if LastKey() = 27
            nOpcao := Alert('Acoes', {'Finalizar', 'Cancelar', 'Continuar'})
            if nOpcao = 1
                exit
            elseif nOpcao = 2
                exit
            else
                loop
            endif    
        endif

        nTotalProduto := nQtdProduto * nPrecoProduto

        if nTotalProduto > nLimite
            Alert(cMensagemLimite)
            loop
        else
            nLimite     := nLimite      - nTotalProduto
            nTotalGeral := nTotalGeral  + nTotalProduto
            @ 07,52 say Transform(nTotalProduto, "@E 999.99")
            @ 09,20 say "Produto salvo com sucesso!" color "r/n"
            nContador++
            InKey(0)
        endif

    enddo
    // Rodape

    @ 12,02 to 12,70
    @ 13,42 say "Total.: "
    @ 13,52 say Transform(nTotalGeral, "@E 9999.99")
    @ 15,42 say "Limite: "

    if nLimite <= 0
        @ 15,52 say Transform(nLimite, "@E 9999.99") + "/" + Transform(nTotalGeral + nLimite, "@E 9999.99") color "r/n"
    else
        @ 15,52 say Transform(nLimite, "@E 9999.99") + "/" + Transform(nTotalGeral + nLimite, "@E 9999.99") color "g/n"
    endif

    @ 17,04 say "Endereco.......: "
    @ 19,04 say "Data da Entrega: "

    @ 17,21 get cEndereco picture "@!" valid !Empty(cEndereco)
    @ 19,21 get dEntrega               valid dEntrega >= dCompra .and. dEntrega <= dCompra + 3
    read

    @ 21,20 say "COMPRA REALIZADA COM SUCESSO" color "r/n"

    exit

    //InKey(0) //Pausa a tela

    //Cupom Fiscal

    // clear

    // set color to "n/gr"

    // @ 02,02 clear to 22,58

    // @ 01,01 to 23,59 double

    // @ 03,28 say "CUPOM"

    // @ 05,04 say "Cliente.......: " + AllTrim(cNome)
    // @ 05,45 say "Idade: "          + AllTrim(Str(nIdade))
    // @ 06,04 say "Data da Compra: " + AllTrim(DtoC(dCompra))

    // @ 08,28 say "Itens" 
    // @ 10,04 say "SEQ"
    // @ 10,15 say "PRODUTO"
    // @ 10,34 say "QTD"
    // @ 10,45 say "VALOR(R$)"

    // @ 12,05 say "1"
    // @ 12,10 say AllTrim(cNomeProduto1)
    // @ 12,33 say AllTrim(Transform(nQtdProduto1, "@E 999.99"))
    // @ 12,45 say AllTrim(Transform(nPrecoProduto1, "@E 999.99"))

    // @ 14,05 say "2"
    // @ 14,10 say AllTrim(cNomeProduto2)
    // @ 14,33 say AllTrim(Transform(nQtdProduto2, "@E 999.99"))
    // @ 14,45 say AllTrim(Transform(nPrecoProduto2, "@E 999.99"))

    // @ 16,05 say "3"
    // @ 16,10 say AllTrim(cNomeProduto3)
    // @ 16,33 say AllTrim(Transform(nQtdProduto3, "@E 999.99"))
    // @ 16,45 say AllTrim(Transform(nPrecoProduto3, "@E 999.99"))

    // @ 18,38 say "Total: "           + AllTrim(Transform(nTotalGeral, "@E 9999.99"))

    // @ 20,15 say "Data da Entrega: " + AllTrim(DToC(dEntrega))
enddo

@ 26,01 say ""
InKey(0)