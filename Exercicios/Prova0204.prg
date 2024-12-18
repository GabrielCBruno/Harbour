// Gabriel Henrique Cavalin Bruno

set date brit 
set epoch to 1940
set century on

clear 

// Variaveis

cNomeVendedor   := Space(30)
dCotacao        := Date()
dAtual          := Date()

cNomeCliente    := Space(30)
nIdade          := 0
cSexo           := Space(1)
nAnoPrimeiraCNH := 0

cMarca          := Space(20)
nAnoFabricacao  := 0
cTipoVeiculo    := Space(1)
nMotor          := 0
nValor          := 0
cUsoVeiculo     := Space(1)

//Processamento

//Vendedor

@ 00,00 to 02,80

@ 00,04 say "JHON DOE - COTACAO DE SEGUROS"
@ 01,01 say "Nome do vendedor:"
@ 01,50 say "Data da cotacao:"

@ 01,19 get cNomeVendedor picture "@!" valid !Empty(cNomeVendedor)
@ 01,67 get dCotacao                   valid dCotacao >= dAtual
read

//Cliente

clear

@ 00,00 to 08,80 double

@ 00,25 say "Dados Pessoas"
@ 02,01 say "Nome do Cliente:"
@ 02,52 say "Idade:"

@ 04,01 say "Ano da primeira CNH:"
@ 04,52 say "Sexo:"
@ 04,61 say "[M]asculino ou [F]eminino"

@ 02,18 get cNomeCliente    picture "@!"   valid !Empty(cNomeCliente)
@ 02,59 get nIdade          picture "999"  valid nIdade > 16 .and. nIdade <= 100
@ 04,22 get nAnoPrimeiraCNH picture "9999" valid nAnoPrimeiraCNH > Year(dAtual) - nIdade
@ 04,59 get cSexo           picture "@!"   valid !Empty(cSexo) .and. (cSexo == 'F' .or. cSexo == 'M')
read

//Veiculo

clear

@ 00,00 to 08,80 double

@ 00,25 say "Dados do Veiculo"
@ 02,02 say "Marca............:"
@ 03,02 say "Ano de Fabricacao:"
@ 04,02 say "Tipo de veiculo..:"
@ 05,02 say "Motor............:"
@ 06,02 say "Valor (Fipe).....:"
@ 07,02 say "Uso do veiculo...:"

@ 04,24 say "[P]asseio [E]sportivo [L]uxo"
@ 07,24 say "[P]articular Pr[o]fissional "

@ 02,21 get cMarca         picture "@!"              valid !Empty(cMarca)
@ 03,21 get nAnoFabricacao picture "9999"            valid nAnoFabricacao > 1940
@ 04,21 get cTipoVeiculo   picture "@!"              valid !Empty(cTipoVeiculo) .and. (cTipoVeiculo == 'P' .or. cTipoVeiculo == 'E' .or. cTipoVeiculo == 'L')
@ 05,21 get nMotor         picture "9.9"             valid nMotor >= 1.0 .and. nMotor <= 9.0
@ 06,21 get nValor         picture "@E 9 999 999.99" valid !Empty(nValor)
@ 07,21 get cUsoVeiculo    picture "@!"              valid !Empty(cUsoVeiculo) .and. (cUsoVeiculo == 'P' .or. cUsoVeiculo == 'O')
read 

nSeguradora1Fipe       := nValor * 0.06
nSeguradora1ValorAnual := nSeguradora1Fipe

nSeguradora2Fipe       := nValor * 0.07
nSeguradora2ValorAnual := nSeguradora2Fipe

//Seguradora 1

if nIdade < 25 .or. nIdade > 65
    nSeguradora1ValorAnual += (nSeguradora1Fipe * 0.1)
endif

if cSexo == 'M'
    nSeguradora1ValorAnual += (nSeguradora1Fipe * 0.1)
else
    nSeguradora1ValorAnual -= (nSeguradora1Fipe * 0.05)
endif

if Year(dAtual) - nAnoPrimeiraCNH > 8
    nSeguradora1ValorAnual -= (nSeguradora1Fipe * 0.1)
elseif Year(dAtual) - nAnoPrimeiraCNH <= 3 .and. Year(dAtual) - nAnoPrimeiraCNH != 0
    nSeguradora1ValorAnual += (nSeguradora1Fipe * 0.15)
endif

if cTipoVeiculo == 'E'
    nSeguradora1ValorAnual += (nSeguradora1Fipe * 0.1)
elseif cTipoVeiculo == 'L'
    nSeguradora1ValorAnual += (nSeguradora1Fipe * 0.2)
endif

if nMotor > 2.0
    nSeguradora1ValorAnual += (nSeguradora1Fipe * 0.15)
endif

nIdadeCarro := Year(dAtual) - nAnoFabricacao

if nIdadeCarro > 20
    nSeguradora1ValorAnual += nSeguradora1Fipe * 0.1
elseif nIdadeCarro > 0
    nSeguradora1ValorAnual += nSeguradora1Fipe * (nIdadeCarro * 0.005)
endif

if cUsoVeiculo == 'O'
    nSeguradora1ValorAnual += (nSeguradora1Fipe * 0.1)
endif

if Month(dCotacao) = 3
    nSeguradora1ValorAnual -= (nSeguradora1Fipe * 0.1)
endif

//Seguradora 2

if nIdade >= 30 .and. nIdade <= 50
    nSeguradora2ValorAnual -= (nSeguradora2Fipe * 0.08)
else 
    if nIdade < 23 .or. nIdade > 60
        nSeguradora2ValorAnual += (nSeguradora2Fipe * 0.15)
    endif
endif

if cSexo == 'M'
    nSeguradora2ValorAnual -= (nSeguradora2Fipe * 0.06)
else
    nSeguradora2ValorAnual += (nSeguradora2Fipe * 0.12)
endif

if Year(dAtual) - nAnoPrimeiraCNH > 5
    nSeguradora2ValorAnual -= (nSeguradora2Fipe * 0.08)
elseif Year(dAtual) - nAnoPrimeiraCNH <= 2 .and. Year(dAtual) - nAnoPrimeiraCNH != 0
    nSeguradora2ValorAnual += (nSeguradora2Fipe * 0.2)
endif

if cTipoVeiculo == 'E'
    nSeguradora2ValorAnual += (nSeguradora2Fipe * 0.15)
 elseif cTipoVeiculo == 'L'
    nSeguradora2ValorAnual += (nSeguradora2Fipe * 0.18)
 endif

if nMotor >= 1.5
    nSeguradora2ValorAnual += (nSeguradora2Fipe * 0.1)
endif

nIdadeCarro := Year(dAtual) - nAnoFabricacao

if nIdadeCarro > 10
    nSeguradora2ValorAnual += nSeguradora2Fipe * 0.08
elseif nIdadeCarro > 0
     nSeguradora2ValorAnual += nSeguradora2Fipe * (nIdadeCarro * 0.008)
endif

if cUsoVeiculo == 'O'
    nSeguradora2ValorAnual += (nSeguradora2Fipe * 0.12)
endif

if Month(dCotacao) = 9
    nSeguradora2ValorAnual -= (nSeguradora2Fipe * 0.08)
endif

//Impressao

cCorSeguradora1 := Space(3)
cCorSeguradora2 := Space(3)

if nSeguradora1ValorAnual > nSeguradora2ValorAnual
    cCorSeguradora1 := 'w/g'
    cCorSeguradora2 := 'w/r'
else
    if nSeguradora1ValorAnual < nSeguradora2ValorAnual
        cCorSeguradora1 := 'w/r'
        cCorSeguradora2 := 'w/g'
    else
        cCorSeguradora1 := 'w/g'
        cCorSeguradora2 := 'w/g'
    endif
endif

clear 

cMensagem := Space(25)

nDifenca := 31 - day(dAtual)

nUltimoDia := day(dAtual) + nDifenca

if nUltimoDia = 1
    nUltimoDia := 30
endif

if Month(dAtual) = 01 //31
    cMensagem := cMensagem + " Janeiro de " + AllTrim(Str(Year(dAtual)))
elseif Month(dAtual) = 02
    cMensagem := cMensagem + " Fevereiro de " + AllTrim(Str(Year(dAtual)))
elseif Month(dAtual) = 03
    cMensagem := cMensagem + " Marco de " + AllTrim(Str(Year(dAtual)))
elseif Month(dAtual) = 04
    cMensagem := cMensagem + " Abril de " + AllTrim(Str(Year(dAtual)))
elseif Month(dAtual) = 05
    cMensagem := cMensagem + " Maio de " + AllTrim(Str(Year(dAtual)))
elseif Month(dAtual) = 06
    cMensagem := cMensagem + " Junho de " + AllTrim(Str(Year(dAtual)))
elseif Month(dAtual) = 07
    cMensagem := cMensagem + " Julho de " + AllTrim(Str(Year(dAtual)))
elseif Month(dAtual) = 08
    cMensagem := cMensagem + " Agosto de " + AllTrim(Str(Year(dAtual)))
elseif Month(dAtual) = 09
    cMensagem := cMensagem + " Setembro de " + AllTrim(Str(Year(dAtual)))
elseif Month(dAtual) = 10
    cMensagem := cMensagem + " Outubro de " + AllTrim(Str(Year(dAtual)))
elseif Month(dAtual) = 11
    cMensagem := cMensagem + " Novembro de " + AllTrim(Str(Year(dAtual)))
elseif Month(dAtual) = 12
    cMensagem := cMensagem + " Dezembro de " + AllTrim(Str(Year(dAtual)))
endif

cMensagem := "Cotacao valida ate " + AllTrim(Str(nUltimoDia))


@ 01,00 to 07,35 color cCorSeguradora1
@ 02,01 say "SEGUROS E CIA" color cCorSeguradora1
@ 03,01 to 03,34 color cCorSeguradora1
@ 04,02 say "Mensal.....:" + Transform(nSeguradora1ValorAnual/12, "@E 99999.99") color cCorSeguradora1
@ 05,02 say "Trimestral.:" + Transform((nSeguradora1ValorAnual/12) * 3, "@E 99999.99") color cCorSeguradora1
@ 06,02 say "Valor Anual:" + Transform(nSeguradora1ValorAnual, "@E 99999.99") color cCorSeguradora1

@ 01,37 to 07,72 color cCorSeguradora2
@ 02,38 say "AUTO SEGUROS S A" color cCorSeguradora2
@ 03,38 to 03,71 color cCorSeguradora2
@ 04,39 say "Mensal.....:" + Transform(nSeguradora2ValorAnual/12, "@E 99999.99") color cCorSeguradora2
@ 05,39 say "Trimestral.:" + Transform((nSeguradora2ValorAnual)/12 * 3, "@E 99999.99") color cCorSeguradora2
@ 06,39 say "Valor Anual:" + Transform(nSeguradora2ValorAnual, "@E 99999.99") color cCorSeguradora2

@ 10,02 say cMensagem
Inkey(0)