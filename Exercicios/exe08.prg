clear

//Variaveis

nQuantProdutoA := 0
nQuantProdutoB := 0
nQuantProdutoC := 0

nValorProdutoA := 0
nValorProdutoB := 0
nValorProdutoC := 0

//Interface

@ 01,01 to 15,37

@ 03,15 say "Pedido"
@ 05,13 say "Qtd"
@ 05,19 say "Valor"

@ 06,03 say "ProdutoA: "

@ 07,03 say "ProdutoB: "

@ 08,03 say "ProdutoC: "

@ 06,18 get nValorProdutoA picture "@E 999.99" valid nValorProdutoA > 0
@ 07,18 get nValorProdutoB picture "@E 999.99" valid nValorProdutoB > 0
@ 08,18 get nValorProdutoC picture "@E 999.99" valid nValorProdutoC > 0
read

//Entrada de Dados

@ 06,13 get nQuantProdutoA picture "999" valid nQuantProdutoA >= 0 .and. nQuantProdutoA <= 100 //Tem a funcao de validar os dados de entrada.
@ 07,13 get nQuantProdutoB picture "999" valid nQuantProdutoB >= 0 .and. nQuantProdutoB <= 100
@ 08,13 get nQuantProdutoC picture "999" valid nQuantProdutoC >= 0 .and. nQuantProdutoC <= 100
read

// Processamento

nTotal := (nQuantProdutoA * nValorProdutoA) + (nQuantProdutoB * nValorProdutoB) + (nQuantProdutoC * nValorProdutoC)
@ 10,08 say "Total da compra: " + AllTrim(Transform(nTotal, "@E 999.99"))

@ 16,01 say ""
