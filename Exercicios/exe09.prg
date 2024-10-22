clear 

set epoch to 1940 //Define a contagem comecando em 1940.
set date brit //Define o padrao britanico (dd/mm/yyyy).
set century on //Permite a utilizacao de 4 digitos no ano.

cLetra      := Space(1)
dDataAtual  := Date ()
dData       := CTod('') //Converte uma string para data.
nNumInteiro := 0
nNumDecimal := 0
cString     := Space(25) 

@ 01,01 to 17,60

@ 03,04 say "Digite uma Letra........: "
@ 04,04 say "Digite uma Data.........: "
@ 05,04 say "Digite um Numero Inteiro: "
@ 06,04 say "Digite um Numero Decimal: "
@ 07,04 say "Digite uma String.......: " 

@ 03,30 get cLetra
@ 04,28 get dData valid dData <= dDataAtual .and. !Empty(dData)
@ 05,30 get nNumInteiro picture "999"
@ 06,30 get nNumDecimal picture "99.99"
@ 07,30 get cString valid !Empty(cString)
read

@ 09,20 say "IMPRESSOES" 
@ 10,04 say "Letra.........: " + cLetra
//@ 11,02 say "Data..........: " + 
@ 12,04 say "Numero Inteiro: " + AllTrim(Str(nNumInteiro))
@ 13,04 say "Numero Decimal: " + AllTrim(Str(nNumDecimal))
@ 14,04 say "String........: " + AllTrim(cString)

@ 18,02 say ""