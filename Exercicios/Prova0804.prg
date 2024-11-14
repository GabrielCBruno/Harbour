// Gabriel Henrique Cavalin Bruno

set message to 24
set wrap on

cHistoricoJogadores := ""
cHistoricoPontos    := "" 

do while .t.

    clear

    nPontuacao   := 0
    cNomeJogador := Space(20)
    nOpcao       := 0
    cSequencia   := Space(20)

    @ 03,01 to 05,79 double

    @ 01,26 say "Jogo de Sequencia de Teclas"

    @ 02,26 to 02,54
    
    @ 04,02 say "Digite o nome do jogador: "
    @ 04,29 get cNomeJogador picture "@!" valid !Empty(cNomeJogador)
    read 

    if LastKey() == 27
        nOpcao := Alert('Menu de Opcoes', {'Sair', 'Continuar'})
        if nOpcao = 2 .or. nOpcao = 0
            loop
        else
            exit
        endif
    endif

    @ 07,02 say "Precione Qualquer tecla para iniciar a partida!"
    
    Inkey(0)
    
    @ 03,01 clear to 25,79

    @ 02,00 to 24,08 double

    cCor      := "r/n"
    nPosicao  := 1
    nLinha    := 02
    nColuna   := 0
    lPerdeu   := .f. 

    @ 23,01 say "Q W E R" color "b/n"

    //Inicializacao

    do while nPosicao < 21
        

        nAleatorio := Hb_randomInt(1, 4)

        if nAleatorio = 1 
            //Q
            cSequencia := SubStr(cSequencia, 1, nPosicao - 1) + "Q" + SubStr(cSequencia, nPosicao + 1)
        elseif nAleatorio = 2
            //W
            cSequencia := SubStr(cSequencia, 1, nPosicao - 1) + "W" + SubStr(cSequencia, nPosicao + 1)
        elseif nAleatorio = 3
            //E
            cSequencia := SubStr(cSequencia, 1, nPosicao - 1) + "E" + SubStr(cSequencia, nPosicao + 1)
        else
            //R
            cSequencia := SubStr(cSequencia, 1, nPosicao - 1) + "R" + SubStr(cSequencia, nPosicao + 1)
        endif
        nPosicao++
    enddo

    //Processamento

    do while .t. 

        @ 03,01 clear to 22,07 

        nPosicao := 1

        do while nPosicao < 21

            if nLinha != 22
                nLinha++
            endif
                
            if SubStr(cSequencia, nPosicao, 1) == 'Q'
                //Q
                nColuna := 01
                @ nLinha,nColuna say SubStr(cSequencia, nPosicao, 1) color cCor
        
            elseif SubStr(cSequencia, nPosicao, 1) == 'W'
                //W
                nColuna := 03
                @ nLinha,nColuna say SubStr(cSequencia, nPosicao, 1) color cCor
        
            elseif SubStr(cSequencia, nPosicao, 1) == 'E'
                //E
                nColuna := 05
                @ nLinha,nColuna say SubStr(cSequencia, nPosicao, 1) color cCor
        
            else
                //R
                nColuna := 07
                @ nLinha,nColuna say SubStr(cSequencia, nPosicao, 1) color cCor
            endif
            nPosicao++
        enddo

        nKey := Inkey(1)

        if nKey == 113 .and. SubStr(cSequencia, 20, 1) == 'Q'
            nPontuacao++
        else
            if nKey == 119 .and. SubStr(cSequencia, 20, 1) == 'W'
                nPontuacao++
            else 
                if nKey == 101 .and. SubStr(cSequencia, 20, 1) == 'E'
                    nPontuacao++
                else 
                    if nKey == 114 .and. SubStr(cSequencia, 20, 1) == 'R'
                        nPontuacao++
                    else
                        //Perdeu
                        Alert("Pontuacao: " + AllTrim(Str(nPontuacao)))
                        lPerdeu := .t.
                    endif
                endif
            endif   
        endif

        if lPerdeu == .t.
            exit
        endif

        cSequencia := SubStr(cSequencia, 1, 19)
        nLinha     := 02
        nAleatorio := Hb_randomInt(1, 4)
        
        if nAleatorio = 1 
            //Q
            cSequencia += "Q"
        elseif nAleatorio = 2
            //W
            cSequencia += "W"
        elseif nAleatorio = 3
            //E
            cSequencia += "E"
        else
            //R
            cSequencia += "R"
        endif
    enddo
    exit
enddo