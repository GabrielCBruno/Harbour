set date brit
set century on
set epoch to 1940

clear 

cPalavra := Space(15)

@ 01,02 say "Digite uma palavra:"

@ 01,22 get cPalavra picTure "@!" valid !Empty(cPalavra)
read

cPalavra          := AllTrim(cPalavra)
cPalavraInvertida := Space(Len(cPalavra))

nI := Len(cPalavra)

do while nI > 0
    cPalavraInvertida += SubStr(cPalavra, nI--, 1) //SubStr(String, Posicao Inicial, tamanho de caracteres que vai pegar)
enddo

@ 03,02 say "A palavra " + cPalavra + " fica invertida desta forma: " + AllTrim(cPalavraInvertida)
@ 05,00 say ""
Inkey(0)