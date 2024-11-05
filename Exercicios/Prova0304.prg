// Gabriel Henrique Cavalin Bruno

set date brit 
set epoch to 1930
set century on

clear 

// Variaveis

dAtual               := Date()

nContador            := 0
nSalarioNovo         := 0
nRemuneracaoTotal    := 0
nOpcao               := 0
nQtdAposentadoHomem  := 0
nQtdAposentadoMulher := 0

nQtdMulherIdadeMaior := 0
nQtdHomemAdmitidos   := 0
nQtdHomemAdicional   := 0
nQtdMulherReducao    := 0

// Processamento

do while .t.
    
    nNumEmpregados   := 0

    @ 00,22 say "Controle de INSS"
    @ 01,02 say "Numero de empregados a serem analisados:"
    @ 01,43 get nNumEmpregados picture "99999" valid nNumEmpregados > 0 .and. nNumEmpregados < 10000
    read

    if LastKey() == 27
        nOpcao := Alert('Menu de Opcoes', {'Sair', 'Continuar'})
        if nOpcao = 2 .or. nOpcao = 0
            loop
        else
            exit
        endif
    endif

    @ 03,25 say "Dados do Colaborador"

    do while nContador < nNumEmpregados

        cNomeColaborador         := Space(25)
        cSexo                    := Space(1)
        dNascimento              := CtoD('')
        dAdmissao                := CtoD('')
        dDemissao                := CtoD('')
        nSalarioBase             := 0
        nAdicionalNoturno        := 0
        nAdicionalInsalubridade  := 0
        
        @ 05,02 say "Nome:"
        @ 05,34 say "Sexo:"
        @ 05,42 say "[M]asculino - [F]eminino"
        @ 07,02 say "Data de Nascimento:"
        @ 08,02 say "Data de Admissao..:"
        @ 08,39 say "Data de Demissao..:"
        @ 09,02 say "Salario Base......:"
        @ 10,02 say "Adicional noturno.:"
        @ 10,34 say "Adicional Insalubridade:"
        
        
        @ 05,08 get cNomeColaborador        picture "@!"            valid !Empty(cNomeColaborador)
        @ 05,40 get cSexo                   picture "@!"            valid cSexo $ "MF"
        @ 07,22 get dNascimento                                     valid Year(dAtual) - Year(dNascimento) >= 18 .and. !Empty(dNascimento)
        @ 08,22 get dAdmissao                                       valid dAdmissao <= dAtual .and. dAdmissao >= CtoD('01/01/1940')
        @ 08,59 get dDemissao                                       valid dDemissao <= dAtual .and. dDemissao > dAdmissao
        @ 09,22 get nSalarioBase            picture "@E 999999.99"  valid nSalarioBase >= 500 .and. nSalarioBase <= 9000
        @ 10,22 get nAdicionalNoturno       picture "999"           valid nAdicionalNoturno >= 0 .and. nAdicionalNoturno < 100
        @ 10,59 get nAdicionalInsalubridade picture "999"           valid nAdicionalInsalubridade >= 0 .and. nAdicionalInsalubridade < 100
        read


        nSalarioNovo := nSalarioBase * (nAdicionalNoturno)/100
        nSalarioNovo += nSalarioBase * (nAdicionalInsalubridade)/100

        if LastKey() == 27
            nOpcao := Alert('Menu de Opcoes', {'Cancelar', 'Retornar', 'Processar'})
            if nOpcao = 1 .or. nOpcao = 3
                exit
            else
                loop
            endif
        endif

        nIdade           := Year(dAtual) - Year(dNascimento)
        nAnosTrabalhados := Year(dAtual) - Year(dAdmissao)

        if cSexo == 'M'
            //Voce pode se aposentar - Homem
            if nIdade >= 59 .and. nAnosTrabalhados >= 27
                nQtdAposentadoHomem++
            endif

            if Year(dAdmissao) < 2006
                nQtdHomemAdmitidos++
            endif
            
            if nAdicionalNoturno != 0
                nQtdHomemAdicional++
            endif

            if nAdicionalInsalubridade != 0
                nQtdHomemAdicional++
            endif
        else
            //Voce pode se aposentar - Mulher
            if nIdade >= 55 .and. nAnosTrabalhados >= 22
                nQtdAposentadoMulher++
            endif
            if nIdade > 85
                nQtdMulherIdadeMaior++
            endif
        endif

        if Year(dAdmissao) <= 2012 .and. Year(dDemissao) >= 2020
            //Trabalhou entre 2012 e 2020
            nSalarioNovo -= nSalarioBase * 0.02

            Alert('Entrou em 2012 a 2020')
            

            if cSexo $ 'F'
                nQtdMulherReducao++
            endif
        endif

        if Year(dAdmissao) <= 2010 .and. Year(dDemissao) >= 2015
            //Trabalhou em 2010 e 2015
            nSalarioNovo += nSalarioBase * 0.06

            Alert('Entrou em 2010 e 2015')

            if cSexo $ 'M'
                nQtdHomemAdicional++
            endif
        endif

        nRemuneracaoTotal += nSalarioNovo
        nContador++
    enddo

    if nContador == nNumEmpregados .or. nOpcao == 3
        exit
    endif
enddo

// Impressao

clear

@ 01,01 to 10,60 double

@ 02,03 clear to 09,59

nTotalAposentados := nQtdAposentadoHomem + nQtdAposentadoMulher
nPercentualHomem  := (nQtdAposentadoHomem/nTotalAposentados) * 100
nPercentualMulher :=(nQtdAposentadoMulher/nTotalAposentados) * 100

@ 01,22 say "Controle de INSS"
@ 03,03 say "Percentual de Homens Aposentados............: " + AllTrim(Transform(nPercentualHomem, "@E 999.9"))
@ 04,03 say "Percentual de Mulhers Aposentados...........: " + AllTrim(Transform(nPercentualMulher, "@E 999.9"))
@ 05,03 say "Valor Total remuneracoes....................: " + AllTrim(Transform(nRemuneracaoTotal, "@E 999 999.99"))
@ 06,03 say "Qtd de mulheres com idade superior a 85 anos: " + AllTrim(Str(nQtdMulherIdadeMaior))
@ 07,03 say "Qtd de homens admitidos antes do ano de 2006: " + AllTrim(Str(nQtdHomemAdmitidos))
@ 08,03 say "Qtd de homens que receberam algum adicional.: " + AllTrim(Str(nQtdHomemAdicional))
@ 09,03 say "Qtd de mulheres que receberam alguma reducao: " + AllTrim(Str(nQtdMulherReducao))

@ 12,01 say ""
Inkey(0)