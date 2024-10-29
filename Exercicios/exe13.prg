clear 

nCodigo   := 0
cMensagem := Space(25)

cMensagem := "O produto do codigo " + AllTrim(Str(nCodigo)) + " sera classificado como: "

@ 01,04 say "Informe o codigo do produto:"

@ 01,33 get nCodigo picture "99" valid !Empty(nCodigo)
read 

if nCodigo <= 15 .and. nCodigo >= 8
    cMensagem := cMensagem + "Limpeza e utensilios domesticos."
elseif nCodigo = 7
    cMensagem := cMensagem + "Higiene Pessoal."
elseif nCodigo = 5 .or. nCodigo = 6
    cMensagem := cMensagem + "Vestuario."
elseif nCodigo <= 4 .and. nCodigo >= 2
    cMensagem := cMensagem + "Alimento perecivel."
elseif nCodigo = 1
    cMensagem := cMensagem + "Alimento nao-perecivel."
else
    cMensagem := "O codigo digitado e invalido."
endif

@ 03,04 say cMensagem

@ 05,01 say ""