set color to "g/n"

clear 

nContador  := 0
nRepeticao := 0
nLinha     := 4
cNome      := Space(15)

@ 01,04 say "Digite o seu nome.............................:"
@ 02,04 say "Digite quantas vezes deseja repetir o seu nome:"

@ 01,52 get cNome      picture "@!" valid !Empty(cNome)
@ 02,52 get nRepeticao picture "99" valid nRepeticao > 0 .and. nRepeticao <= 20
read

do while nContador < nRepeticao 
    @ nLinha++,4 say "O seu nome e: " + AllTrim(cNome)
    nContador++
enddo

Inkey(0)

@ 22,01 say ""