clear

nValor1 := 0
nValor2 := 0

//Solicitação de dados para o usuário

@ 01,01 say "Informe o valor 1: "
@ 02,01 say "Informe o valor 2: "

// Entrada de Dados

@ 01,20 get nValor1
@ 02,20 get nValor2
read

// Processamento

@ 04,01 say "************* Valores antes da troca *************"
@ 05,01 say "Valor1: " + AllTrim(Str(nValor1)) //Str(valor a ser convertido): função que converte numerico para string.
@ 06,01 say "Valor2: " + AllTrim(Str(nValor2))
  
@ 08,01 say "************* Valores depois da troca *************"

nTroca  := nValor1
nValor1 := nValor2
nValor2 := nTroca

@ 10,01 say "Valor1: " + AllTrim(Str(nValor1))
@ 11,01 say "Valor2: " + AllTrim(Str(nValor2))

@ 12,01 say ""
