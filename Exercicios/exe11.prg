clear 

cNome  := Space(15)
nIdade := 0

@ 01,01 to 20,60 double

@ 03,15 say "Software de Classificacao do Nadador"
@ 05,04 say "Informe o nome do nadador: "
@ 06,04 say "Informe a idade..........: "

@ 05,29 get cNome valid !Empty(cNome)
@ 06,29 get nIdade picture "99" valid nIdade >= 5

if nIdade >= 18
    @ 08,04 say "O nadador " + AllTrim(cNome) + " com a idade " + AllTrim(Str(nIdade))
