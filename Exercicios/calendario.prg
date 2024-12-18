set date brit 
set epoch to 1930
set century on

clear 

dAtual  := Date()
nLinha  := 07
nColuna := 0

@ 01,01 to 20,31 double
@ 02,10 say "Calendario"
@ 03,02 to 03,30

@ 05,03 say "Dom"
@ 05,07 say "Seg"
@ 05,11 say "Ter"
@ 05,15 say "Qua"
@ 05,19 say "Qui"
@ 05,23 say "Sex"
@ 05,27 say "Sab"

nDiferenca   := Day(dAtual) - 1
dPrimeiroDia := dAtual - nDiferenca

do while .t.
    if Month(dPrimeiroDia) != Month(dAtual)
        exit
    endif

    if Day(dPrimeiroDia) = Day(dAtual)
        cCor := 'r/n'
    else
        cCor := 'w/n'
    endif

    if Dow(dPrimeiroDia) = 1
        //Domingo
        nColuna := 03
        @ nLinha, nColuna say Day(dPrimeiroDia) color cCor
    elseif Dow(dPrimeiroDia) = 2
        //Segunda
        nColuna := 07
        @ nLinha, nColuna say Day(dPrimeiroDia) color cCor
    elseif Dow(dPrimeiroDia) = 3
        //Terca
        nColuna := 11
        @ nLinha, nColuna say Day(dPrimeiroDia) color cCor
    elseif Dow(dPrimeiroDia) = 4
        //Quarta
        nColuna := 15
        @ nLinha, nColuna say Day(dPrimeiroDia) color cCor
    elseif Dow(dPrimeiroDia) = 5
        //Quinta
        nColuna := 19
        @ nLinha, nColuna say Day(dPrimeiroDia) color cCor
    elseif Dow(dPrimeiroDia) = 6
        //Sexta
        nColuna := 23
        @ nLinha, nColuna say Day(dPrimeiroDia) color cCor
    elseif Dow(dPrimeiroDia) = 7
        //Sabado
        nColuna := 27
        @ nLinha, nColuna say Day(dPrimeiroDia) color cCor
        nLinha += 2
    endif
    dPrimeiroDia++
enddo
@ 22,01 say ""
Inkey(0)