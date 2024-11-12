clear

do while .t.

    cPalavraChave := Space( 20 )
    cEncontrou    := Space( 20 )
    
    @ 01,01 get cPalavraChave picture '@!' valid !Empty( cPalavraChave )
    read

    cPalavraChave := AllTrim( cPalavraChave )
    nErros       := 0

    do while nErros < 5

        cLetra    := Space( 1 )
        nTamanho  := Len( cPalavraChave )

        @ 02,01 get cLetra picture '@!' valid !Empty( cLetra )
        read

        //lAcertou := .f.

        do while nTamanho > 0

            if cLetra == SubStr( cPalavraChave, nTamanho, 1 )
                //lAcertou := .t.
                cEncontrou := SubStr( cEncontrou, 1, nTamanho - 1  ) + cLetra + SubStr( cEncontrou, nTamanho + 1  )
            endif
            
            nTamanho--

        enddo

        @ 03,01 say cEncontrou

        if !lAcertou
            nErros++
        endif

        if AllTrim(cEncontrou  ) == cPalavraChave
            Alert( 'Ganhou!')
            exit
        endif

    enddo

enddo