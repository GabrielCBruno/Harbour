clear 

cNome   := Space(15)
nIdade  := 0
nLinha  := 8
nColuna := 4

@ 01,01 to 20,70 double

@ 03,15 say "Software de Classificacao do Nadador"
@ 05,04 say "Informe o nome do nadador: "
@ 06,04 say "Informe a idade..........: "

@ 05,31 get cNome  picture "@!" valid !Empty(cNome)
@ 06,31 get nIdade picture "99" valid nIdade >= 5
read

if nIdade > 18
    @ nLinha,nColuna say "O nadador " + AllTrim(cNome) + " com a idade " + AllTrim(Str(nIdade)) + " sera categorizado como SENIOR."
elseif nIdade >= 14
    @ nLinha,nColuna say "O nadador " + AllTrim(cNome) + " com a idade " + AllTrim(Str(nIdade)) + " sera categorizado como JUVENIL B."
elseif nIdade >= 11
    @ nLinha,nColuna say "O nadador " + AllTrim(cNome) + " com a idade " + AllTrim(Str(nIdade)) + " sera categorizado como JUVENIL A."
elseif nIdade >= 8
    @ nLinha,nColuna say "O nadador " + AllTrim(cNome) + " com a idade " + AllTrim(Str(nIdade)) + " sera categorizado como INFATIL B."
else
    @ nLinha,nColuna say "O nadador " + AllTrim(cNome) + " com a idade " + AllTrim(Str(nIdade)) + " sera categorizado como INFATIL A."
endif

@ 23,01 say ""