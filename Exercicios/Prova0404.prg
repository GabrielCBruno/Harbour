// Gabriel Henrique Cavalin Bruno

set date brit 
set epoch to 1930
set century on
set message to 12 //A mensagem sera exibida na tela
set wrap on //Volta para a primeira opcao do menu dinamico

clear 

// Variaveis

dAtual       := Date()
nCodigo      := 1
dCadastro    := dAtual 

cSenhaTodos  := ""
cDatasTodos  := ""
nOpcao := 0

// Processamento

do while .t.
    clear
    
    @ 00,00 to 10,50 double
    
    @ 01,20 say "Menu de Opcoes"
    @ 02,02 prompt "Cadastrar" message "Cadatrar Senha" // Estrutura usada para criar um menu dinamico
    @ 03,02 prompt "Consultar" message "Consultar Senha"
    @ 04,02 prompt "Sair"      message "Sair do Programa"
    menu to nOpcao
     
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
            
            if Len(AllTrim(cSenha)) < 8
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
                do while .t.
                    nCodPesquisa := 0
                    @ 01,02 say "Codigo:"
                    @ 01,10 get nCodPesquisa picture "999" valid nCodPesquisa > 0
                    read

                    if LastKey() == 27
                        nOpcao2 := Alert('Menu de Opcoes - Cadastro', {'Sair', 'Continuar'})
                        if nOpcao2 = 2 .or. nOpcao2 = 0
                            loop
                        else
                            exit
                        endif
                    endif
                    
                    if nCodPesquisa < nCodigo
                        @ 03,02 say "Codigo.......: " + Str(nCodPesquisa)
                        @ 04,02 say "Senha........: " + AllTrim(SubStr(cSenhaTodos, nCodPesquisa * 12 - 11, 12)) // Para recuperar os dados salvos numa string deve usar: Codigo * tamanho da senha - (tamanho da senha - 1)
                        @ 05,02 say "Data.........: " + AllTrim(SubStr(cDatasTodos, nCodPesquisa * 10 - 9, 10))
                        InKey(0)
                        exit
                    else
                        Alert("O Codigo digitado nao existe")
                        loop
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

Inkey(0)