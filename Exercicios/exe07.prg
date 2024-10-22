clear

nNum1 := 0
nNum2 := 0

@ 01,01 to 15,30

@ 02,08 say "Operacoes Basicas"

@ 05,05 say "Numero 1: "
@ 06,05 say "Numero 2: "

@ 05,15 get nNum1 picture "9999" //Máscara que limitará o usuário a escolher um valor entre 0 e 9999
@ 06,15 get nNum2 picture "9999"
read

@ 09,05 say "Adicao.......: " + AllTrim(Str(nNum1 + nNum2))
@ 10,05 say "Subtracao....: " +AllTrim(Str(nNum1 - nNum2))
@ 11,05 say "Divisao......: " + AllTrim(Str(nNum1/nNum2))
@ 12,05 say "Multiplicacao: " + AllTrim(Str(nNum1 * nNum2))

@ 17,01 say ""