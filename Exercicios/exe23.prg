clear 

cCodigo   := 0
cMensagem := Space(50)

@ 01,01 to 15,45 double

@ 03,04 say "Digite o codigo do produto: "

@ 03,32 get cCodigo picture "@!" valid !Empty(cCodigo)

cMensagem := "O produto com o codigo " + AllTrim(cCodigo) + " sera classificado como: "

if cCodigo <= 15 .and. cCodigo >= 8
    cMensagem := cMensagem + " Limpeza e utensilios domesticos."
elseif cCodigo = 7
    cMensagem := cMensagem + " Higiene pessoal."
elseif cCodigo = 5 .our. cCodigo = 6
    cMensagem := cMensagem + " Vestuario."
elseif cCodigo <= 4 .and. cCodigo >= 2
    cMensagem := cMensagem + " Alimento perecivel."
elseif cCodigo = 1
    cMensagem := cMensagem + " Alimento nao perecivel."
else
    @ 05,04 say "Codigo Invalido"
endif