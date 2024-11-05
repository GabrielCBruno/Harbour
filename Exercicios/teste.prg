clear 

cNome := Space(25)

@ 01,02 say "Digite um nome completo:"

@ 01,27 get cNome picture "@!" valid !Empty(cNome)
read 

cNome := AllTrim(cNome)
nI := 1

do while nI++ < len(cNome)
    if cNome == ""
        exit
    else
        nI++
    endif
enddo

cPrimeiroNome += SubStr(cNome, 1, nI)

@ 03,02 say cPrimeiroNome