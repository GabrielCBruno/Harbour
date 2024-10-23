clear 

set date brit
set epoch to 1940
set century on 

// Variaveis

// A data da entrega tem que ser 3 dias depois da compra. Cupom

cNome          := Space(25)
nIdade         := 0
cEndereco      := Space(35)
dAtual         := Date()
dCompra        := CToD('')
dEntrega       := CTod('')
nTotalProduto  := 0
nTotalGeral    := 0

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

@ 01,01 to 20,71 double

@ 03,25 say "Informacoes da Venda"
@ 05,04 say "Nome..............: "
@ 06,04 say "Idade.............:"
@ 07,04 say "Data da Compra....: "

@ 05,24 get cNome       picture "@!"  valid !Empty(cNome)
@ 06,24 get nIdade      picture "999" valid !Empty(nIdade) .and. nIdade > 18 .and. nIdade <= 120
@ 07,24 get dCompra                   valid !Empty(dCompra)   .and. dCompra <= dAtual
read

@ 02,02 clear to 17,70 //Limpar Quadrado

@ 03,25 say "Informacoes dos Itens"

@ 05,04 say "SEQ"
@ 05,16 say "PRODUTO"
@ 05,35 say "QTD"
@ 05,42 say "PRECO"
@ 05,52 say "VALOR(R$)"

//Produto 1

@ 07,05 say "1"

@ 07,10 get cNomeProduto1   picture "@!"        valid !Empty(cNomeProduto1)
@ 07,33 get nQtdProduto1    picture "@E 999.99" valid !Empty(nQtdProduto1)   .and. nQtdProduto1 > 0 .and. nQtdProduto1 < 100
@ 07,42 get nPrecoProduto1  picture "@E 999.99" valid !Empty(nPrecoProduto1) .and. nPrecoProduto1 > 0
read

nTotalProduto := nQtdProduto1 * nPrecoProduto1
nTotalGeral   := nTotalGeral  + nTotalProduto

@ 07,52 say Transform(nTotalProduto, "@E 999.99")

//Produto 2

@ 09,05 say "2" 

@ 09,10 get cNomeProduto2   picture "@!"        valid !Empty(cNomeProduto2)
@ 09,33 get nQtdProduto2    picture "@E 999.99" valid !Empty(nQtdProduto2)   .and. nQtdProduto2 > 0 .and. nQtdProduto2 < 100
@ 09,42 get nPrecoProduto2  picture "@E 999.99" valid !Empty(nPrecoProduto2) .and. nPrecoProduto2 > 0
read

nTotalProduto := nQtdProduto2 * nPrecoProduto2
nTotalGeral   := nTotalGeral  + nTotalProduto

@ 09,52 say Transform(nTotalProduto, "@E 999.99")

//Produto 3

@ 11,05 say "2"

@ 11,10 get cNomeProduto3   picture "@!"        valid !Empty(cNomeProduto3)
@ 11,33 get nQtdProduto3    picture "@E 999.99" valid !Empty(nQtdProduto3)   .and. nQtdProduto3 > 0 .and. nQtdProduto3 < 100
@ 11,42 get nPrecoProduto3  picture "@E 999.99" valid !Empty(nPrecoProduto3) .and. nPrecoProduto3 > 0
read

nTotalProduto := nQtdProduto3 * nPrecoProduto3
nTotalGeral   := nTotalGeral  + nTotalProduto

@ 11,52 say Transform(nTotalProduto, "@E 999.99")

@ 13,42 say "Total"
@ 13,52 say Transform(nTotalGeral, "@E 999.99")

//

@ 15,04 say "Endereco.......: "
@ 16,04 say "Data da Entrega: "

@ 15,21 get cEndereco picture "@!" valid !Empty(cEndereco)
@ 16,21 get dEntrega               valid dEntrega > dAtual .and. dEntrega < dAtual + 3
read

//Cupom Fiscal

@ 23,01 say ""