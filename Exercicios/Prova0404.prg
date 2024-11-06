// Gabriel Henrique Cavalin Bruno

set date brit 
set epoch to 1930
set century on

clear 

// Variaveis

dAtual       := Date()
nCodigo      := 1
dCadastro    := dAtual

cCodigoTodos := ""
cSenhaTodos  := ""
cDatasTodos  := ""

// Processamento

do while .t.
    clear
    @ 00,00 to 10,50 double
    @ 01,20 say "Menu de Opcoes"
    @ 02,02 say "1- Cadastrar"
    @ 03,02 say "2- Consultar"
    @ 04,02 say "3- Sair"
    @ 06,02 say "Opcao:"

    nOpcao := 0
    
    @ 06,09 get nOpcao picture "9" valid nOpcao > 0 .and. nOpcao <= 3
    read
     
    if nOpcao = 1 //Cadastrar
        @ 01,01 clear to 09,49
        do while .t.
            cSenha := Space(12)
            @ 01,02 say "Codigo.......: " + AllTrim(Str(nCodigo))
            @ 02,02 say "Senha........: "
            @ 03,02 say "Data Cadastro: "

            @ 02,17 get cSenha valid !Empty(cSenha)
            @ 03,17 get dCadastro valid dCadastro <= dAtual .and. dCadastro > CtoD('01/01/1940')
            read

            if LastKey() == 27
                nOpcao := Alert('Menu de Opcoes - Cadastro', {'Sair', 'Continuar'})
                if nOpcao = 2 .or. nOpcao = 0
                    loop
                else
                    exit
                endif
            endif

            cSenha := AllTrim(cSenha)
            
            if Len(cSenha) < 8
                Alert("A senha deve ter no minimo 8 caracteres!")
                loop
            endif
            
            nI            := 1
            cComparador   := Space(1)

            lTemNum   := .f.
            lTemMais  := .f.
            lTemMinus := .f.
            lTemEspec := .f.
            
            do while nI < Len(cSenha) 
                cComparador := SubStr(cSenha, nI++, 1)
                if cComparador $ "0123456789"
                    lTemNum := .t.
                endif

                if lTemNum = .f. .and. nI == Len(cSenha)
                    Alert ("A senha deve possuir um caractere numerico")
                    exit
                endif

                if cComparador $ "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                    lTemMais := .t.
                endif

                if lTemMais = .f. .and. nI == Len(cSenha)
                    Alert ("A senha deve possuir uma letra maiuscula")
                    exit
                endif

                if cComparador $ "abcdefghijklmnopqrstuvwxyz"
                    lTemMinus := .t.
                endif
                
                if lTemMinus = .f. .and. nI == Len(cSenha)
                    Alert("A senha deve possuir uma letra minuscula") 
                    exit
                endif
                
                if cComparador $ "!@#$%^&*()-+"
                    lTemEspec := .t.
                endif

                if lTemEspec = .f. .and. nI == Len(cSenha)
                    Alert("A senha deve possuir um caractere especial") 
                    exit
                endif
            enddo

            if lTemNum = .f. .or. lTemMais = .f. .or. lTemMinus = .f. .or. lTemEspec = .f.
                loop
            endif

            cSenha += "|"
            cCodigoTodos += AllTrim(Str(nCodigo))
            cSenhaTodos  += cSenha 
            cDatasTodos  += DtoC(dCadastro)
            nCodigo++
        enddo
    else
        if nOpcao = 2 //Consulta
            @ 01,01 clear to 09,49
            if cSenhaTodos == ""
                Alert("Nao existe senhas cadastradas!")
            else
                nCodPesquisa := 0
                @ 01,02 say "Codigo:"
                @ 01,10 get nCodPesquisa picture "999" valid nCodPesquisa > 0
                read

                if LastKey() == 27
                    nOpcao := Alert('Menu de Opcoes - Cadastro', {'Sair', 'Continuar'})
                    if nOpcao = 2 .or. nOpcao = 0
                        loop
                    else
                        exit
                    endif
                endif

                lAchou := .f.

                do while lAchou != .t.
                    if Str(nCodPesquisa) $ cCodigoTodos
                        nJ              := 1
                        nContador       := 0
                        do while .t.
                            cCaractere := SubStr(cSenhaTodos, nJ++, 1)
                            if (cCaractere == '|')
                                //Pipe passados
                                nContador++
                                if nContador = nCodPesquisa
                                    nPosicaoInicial := nJ
                                endif
                            endif

                            if nContador > nCodPesquisa 
                                @ 02,02 say "Senha........: " + SubStr(cSenhaTodos, nPosicaoInicial, nJ - nPosicaoInicial)
                                lAchou := .t.
                                exit
                            endif
                        enddo
                    else
                        Alert("O Codigo digitado nao existe")
                        exit
                    endif
                enddo

            endif
        else
            exit
        endif 
    endif
enddo

// Impressao

clear

@ 12,01 say ""
Inkey(0)