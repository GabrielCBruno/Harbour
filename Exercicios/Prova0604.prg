// Gabriel Henrique Cavalin Bruno

set message to 21
set wrap on

clear 

// Variaveis

nOpcao := 0

// Processamento

@ 00,00 to 22,57 double

do while .t.

    @ 03,01 clear to 20,56

    @ 03,15 say "Jogo da Forca"

    @ 05,02 prompt "Iniciar uma nova partida" message "Inicia uma partida nova de forca"
    @ 06,02 prompt "Encerrar o jogo"          message "Sair do programa"
    menu to nOpcao

    if nOpcao = 1
        @ 05,01 clear to 15,56

        cNomeParticipante := Space(25)
        cDificuldade      := Space(1)
        cPalavraChave     := Space(20)

        @ 05,02 say "Nome do Participante:"
        @ 06,02 say "Nivel de dificuldade:"
        @ 07,02 say "Palavra Chave.......:"

        @ 06,26 say "[F]acil - [M]edio - [D]ificil"

        @ 05,24 get cNomeParticipante picture "@!" valid !Empty(cNomeParticipante)
        @ 06,24 get cDificuldade      picture "@!" valid cDificuldade $ "FMD"
        @ 07,24 get cPalavraChave     picture "@!" valid !Empty(cPalavraChave) color "w/w"
        read 

        if LastKey() == 27
            nOpcao := Alert('Menu de Opcoes', {'Sair', 'Continuar'})
            if nOpcao = 1 .or. nOpcao = 0
                loop
            endif
        endif

        cPalavraChave := AllTrim(cPalavraChave)
        nErros        := 0
         
        if cDificuldade == 'F'
            nChances := 6
            cDica1   := Space(25)
            cDica2   := Space(25)
            cDica3   := Space(25)

            @ 09,20 say "Dicas:"

            @ 10,02 say "Dica 1:"
            @ 11,02 say "Dica 2:"
            @ 12,02 say "Dica 3:"

            @ 10,10 get cDica1 picture "@!" valid !Empty(cDica1)
            @ 11,10 get cDica2 picture "@!" valid !Empty(cDica2)
            @ 12,10 get cDica3 picture "@!" valid !Empty(cDica3)
            read

        elseif cDificuldade == 'M'
            nChances := 5
        else
            nChances := 4
        endif

        @ 05,01 clear to 15,56

        cLetrasDigitadas := ""
        
        @ 05,02 say "A Palavra Chave possui " + AllTrim(Str(Len(cPalavraChave))) + " Letras."
        nLetrasFalta := 0

        cPalavraMisteriosa := Space(Len(cPalavraChave))

        do while .t.
            cLetra             := Space(1)
            nTamanho           := Len(cPalavraChave) 
            
            @ 07,02 say "Letras ja ditadas..: " + cLetrasDigitadas
            @ 08,02 say "Palavra Formada....: " + cPalavraMisteriosa color "w/n"
            
            @ 10,02 say "Digite uma Letra...: "
            @ 10,23 get cLetra picture "@!" valid !Empty(cLetra)
            read

            if LastKey() == 27
                nOpcao := Alert('Menu de Opcoes', {'Sair', 'Continuar'})
                if nOpcao = 1 .or. nOpcao = 0
                    exit
                endif
            endif

            
            if cLetra $ cLetrasDigitadas     
                Alert("A letra ja foi digitada")
                loop
            else
                if cLetra $ cPalavraChave
                    //Acertou
                    Alert("Acertou")

                    cLetrasDigitadas += cLetra
                    cLetrasDigitadas += " "
                    
                    do while nTamanho > 0

                        if cLetra == SubStr(cPalavraChave, nTamanho, 1)
                            cPalavraMisteriosa := SubStr(cPalavraMisteriosa, 1, nTamanho - 1) + cLetra + SubStr(cPalavraMisteriosa, nTamanho + 1)
                        endif

                        nTamanho--
                    enddo

                    if AllTrim(cPalavraMisteriosa) == AllTrim(cPalavraChave)
                        Alert( 'Voce Ganhou! A palavra chave era: ' + cPalavraChave)
                        exit
                    endif
                else
                    //Errou
                    Alert("Errou")
                    nErros++

                    cLetrasDigitadas += cLetra
                    cLetrasDigitadas += " "

                    lMorreu := .f.

                    if cDificuldade == 'F'
                        if nErros = 1
                            @ 12,32 say "(-_-)"
                        elseif nErros = 2
                            //Dica 1
                            @ 13,34 say "|"
                            @ 14,34 say "|"
                            @ 12,02 say "Dica 1: " + AllTrim(cDica1)
                        elseif nErros = 3
                            //Dica 2
                            @ 13,33 say "/"
                            @ 13,35 say "\"
                            @ 14,02 say "Dica 2: " + AllTrim(cDica2)
                        elseif nErros = 4
                            //Dica 3
                            @ 15,33 say "/"
                            @ 15,35 say "\"
                            @ 16,02 say "Dica 3: " + AllTrim(cDica3)
                        elseif nErros = 5
                            @ 15,32 say "_"
                            @ 15,36 say "_"
                        endif
                    else
                        if cDificuldade == 'M'
                            if nErros = 1
                                @ 12,32 say "(-_-)"
                            elseif nErros = 2
                                @ 13,34 say "|"
                                @ 14,34 say "|"
                            elseif nErros = 3
                                @ 13,33 say "/"
                                @ 13,35 say "\"
                            elseif nErros = 4
                                @ 15,33 say "/"
                                @ 15,35 say "\"
                                @ 15,32 say "_"
                                @ 15,36 say "_"
                            endif
                        else
                            if nErros = 1
                                @ 12,32 say "(-_-)"
                            elseif nErros = 2
                                @ 13,34 say "|"
                                @ 14,34 say "|"
                            elseif nErros = 3
                                @ 13,33 say "/"
                                @ 13,35 say "\"
                                @ 15,33 say "/"
                                @ 15,35 say "\"
                                @ 15,32 say "_"
                                @ 15,36 say "_"
                            endif
                        endif
                    endif

                    // Boneco Homem Palito
                    //   ___
                    //    |
                    //    |
                    //  (-_-) // Erro 1
                    //   /|\
                    //    |
                    //  _/ \_
                    //  
                    //    

                    if nErros = nChances
                        @ 09,33 say "___"
                        @ 10,34 say "|"
                        @ 11,34 say "|"
                        @ 23,02 say ""
                        InKey(0)
                        Alert("Voce Perdeu")
                        exit
                    endif

                endif
            endif
        enddo
    else
        exit
    endif
enddo

@ 23,02 say ""

Inkey(0)