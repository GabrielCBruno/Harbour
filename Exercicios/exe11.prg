clear 

cNome     := Space(15)
cMensagem := Space(70)
nIdade    := 0
nLinha    := 8
nColuna   := 4

@ 01,01 to 20,72 double

@ 03,15 say "Software de Classificacao do Nadador"
@ 05,04 say "Informe o nome do nadador: "
@ 06,04 say "Informe a idade..........: "

@ 05,31 get cNome  picture "@!"  valid !Empty(cNome)
@ 06,31 get nIdade picture "999" valid nIdade >= 5 .and. nIdade <= 105
read

cMensagem := "O nadador " + AllTrim(cNome) + " com a idade " + AllTrim(Str(nIdade)) + " sera categorizado como "

if nIdade >= 18
    cMensagem := cMensagem + "SENIOR."
elseif nIdade >= 14
    cMensagem := cMensagem + "JUVENIL B."
elseif nIdade >= 11
    cMensagem := cMensagem + "JUVENIL A."
elseif nIdade >= 8
    cMensagem := cMensagem + "INFANTIL B."
else
    cMensagem := cMensagem + "INFATIL A."
endif

@ nLinha,nColuna say cMensagem

@ 23,01 say ""