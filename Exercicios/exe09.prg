clear 

set epoch to 1940 //Define a contagem comecando em 1940.
set date brit     //Define o padrao britanico (dd/mm/yyyy).
set century on    //Permite a utilizacao de 4 digitos no ano.

cLetra      := Space(1)
dDataAtual  := Date ()
dData       := CTod('') //Converte uma string para data.
nNumInteiro := 0
nNumDecimal := 0
cString     := Space(25) 

@ 01,01 to 17,60 double

@ 02,20 say "Entrada de Dados"

@ 04,04 say "Digite uma Letra........: "
@ 05,04 say "Digite uma Data.........: "
@ 06,04 say "Digite um Numero Inteiro: "
@ 07,04 say "Digite um Numero Decimal: "
@ 08,04 say "Digite uma String.......: " 

@ 04,30 get cLetra picture "@!"
@ 05,30 get dData valid dData <= dDataAtual .and. !Empty(dData)
@ 06,30 get nNumInteiro picture "999"
@ 07,30 get nNumDecimal picture "@E 999.99"
@ 08,30 get cString valid !Empty(cString)
read

@ 10,20 say "IMPRESSOES"

@ 11,04 say "Letra.........: " + cLetra
@ 12,04 say "Data..........: " + AllTrim(DToC(dData)) //Converte uma data para string.
@ 13,04 say "Numero Inteiro: " + AllTrim(Str(nNumInteiro))
@ 14,04 say "Numero Decimal: " + AllTrim(Transform(nNumDecimal), "@E 999.99")
@ 15,04 say "String........: " + AllTrim(cString)

@ 18,02 say ""