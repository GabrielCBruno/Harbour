clear 

nContador := 0
nLinha    := 3
cNome     := Space(15)

@ 01,04 say "Digite o seu nome:"

@ 01,23 get cNome picture "@!" valid !Empty(cNome)
read

do while nContador < 10 
    @ nLinha,4 say "O seu nome e: " + AllTrim(cNome)
    nLinha++
    nContador++
enddo

@ 15,01 say ""