clear 

set date brit
set epoch to 1940
set century on 

// Variaveis

cNome          := Space(25)
nIdade         := 0
cEndereco      := Space(35)
dAtual         := Date()
dCompra        := CToD('')
dEntrega       := CTod('')
nTotalProduto  := 0
nTotalGeral    := 0
nLimite        := 0
cMensagemAlert := Space(25)

cNomeProduto1  := Space(20)
nQtdProduto1   := 0
nPrecoProduto1 := 0

cNomeProduto2  := Space(20)
nQtdProduto2   := 0
nPrecoProduto2 := 0

cNomeProduto3  := Space(20)
nQtdProduto3   := 0
nPrecoProduto3 := 0

// Processamento

@ 01,01 to 23,71 double

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

InKey(0)

@ 02,02 clear to 17,70 //Limpar Quadrado

@ 03,25 say "Informacoes dos Itens"

@ 05,04 say "SEQ"
@ 05,16 say "PRODUTO"
@ 05,35 say "QTD"
@ 05,42 say "PRECO"
@ 05,51 say "VALOR(R$)"

//Produto 1

@ 07,05 say "1"

@ 07,10 get cNomeProduto1   picture "@!"        valid !Empty(cNomeProduto1)
@ 07,33 get nQtdProduto1    picture "@E 999.99" valid !Empty(nQtdProduto1)   .and. nQtdProduto1 > 0 .and. nQtdProduto1 < 100
@ 07,42 get nPrecoProduto1  picture "@E 999.99" valid !Empty(nPrecoProduto1) .and. nPrecoProduto1 > 0
read

nTotalProduto := nQtdProduto1 * nPrecoProduto1
nLimite       := nLimite      - nTotalProduto
nTotalGeral   := nTotalGeral  + nTotalProduto

@ 07,52 say Transform(nTotalProduto, "@E 999.99")

//Produto 2

@ 09,05 say "2" 

@ 09,10 get cNomeProduto2   picture "@!"        valid !Empty(cNomeProduto2)
@ 09,33 get nQtdProduto2    picture "@E 999.99" valid !Empty(nQtdProduto2)   .and. nQtdProduto2 > 0 .and. nQtdProduto2 < 100
@ 09,42 get nPrecoProduto2  picture "@E 999.99" valid !Empty(nPrecoProduto2) .and. nPrecoProduto2 > 0
read

nTotalProduto := nQtdProduto2 * nPrecoProduto2
nLimite       := nLimite      - nTotalProduto
nTotalGeral   := nTotalGeral  + nTotalProduto

@ 09,52 say Transform(nTotalProduto, "@E 999.99")

//Produto 3

@ 11,05 say "3"

@ 11,10 get cNomeProduto3   picture "@!"        valid !Empty(cNomeProduto3)
@ 11,33 get nQtdProduto3    picture "@E 999.99" valid !Empty(nQtdProduto3)   .and. nQtdProduto3 > 0 .and. nQtdProduto3 < 100
@ 11,42 get nPrecoProduto3  picture "@E 999.99" valid !Empty(nPrecoProduto3) .and. nPrecoProduto3 > 0
read

nTotalProduto := nQtdProduto3 * nPrecoProduto3
nLimite       := nLimite      - nTotalProduto
nTotalGeral   := nTotalGeral  + nTotalProduto

@ 11,52 say Transform(nTotalProduto, "@E 999.99")

// Rodape

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

InKey(0) //Pausa a tela

//Cupom Fiscal

clear

set color to "n/gr"

@ 02,02 clear to 22,58

@ 01,01 to 23,59 double

@ 03,28 say "CUPOM"

@ 05,04 say "Cliente.......: " + AllTrim(cNome)
@ 05,45 say "Idade: "          + AllTrim(Str(nIdade))
@ 06,04 say "Data da Compra: " + AllTrim(DtoC(dCompra))

@ 08,28 say "Itens" 
@ 10,04 say "SEQ"
@ 10,15 say "PRODUTO"
@ 10,34 say "QTD"
@ 10,45 say "VALOR(R$)"

@ 12,05 say "1"
@ 12,10 say AllTrim(cNomeProduto1)
@ 12,33 say AllTrim(Transform(nQtdProduto1, "@E 999.99"))
@ 12,45 say AllTrim(Transform(nPrecoProduto1, "@E 999.99"))

@ 14,05 say "2"
@ 14,10 say AllTrim(cNomeProduto2)
@ 14,33 say AllTrim(Transform(nQtdProduto2, "@E 999.99"))
@ 14,45 say AllTrim(Transform(nPrecoProduto2, "@E 999.99"))

@ 16,05 say "3"
@ 16,10 say AllTrim(cNomeProduto3)
@ 16,33 say AllTrim(Transform(nQtdProduto3, "@E 999.99"))
@ 16,45 say AllTrim(Transform(nPrecoProduto3, "@E 999.99"))

@ 18,38 say "Total: "           + AllTrim(Transform(nTotalGeral, "@E 9999.99"))

@ 20,15 say "Data da Entrega: " + AllTrim(DToC(dEntrega))
@ 23,01 say ""

InKey(0)