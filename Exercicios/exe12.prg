clear 

nNum1     := 0
nNum2     := 0
nNum3     := 0
nMaior    := 0
cMensagem := Space(50)

@ 01,01 to 10,70 double

@ 03,04 say "Digite o primeiro numero: "
@ 04,04 say "Digite o segundo numero.: "
@ 05,04 say "Digite o terceiro numero: "

@ 03,30 get nNum1 picture "9999" valid !Empty(nNum1)
@ 04,30 get nNum2 picture "9999" valid !Empty(nNum2) .and. nNum1 != nNum2
@ 05,30 get nNum3 picture "9999" valid !Empty(nNum3) .and. nNum3 != nNum1 .and. nNum3 != nNum2
read 

cMensagem := "Entre os numeros digitados: " + AllTrim(Str(nNum1)) + ", " + AllTrim(Str(nNum2)) + " e " + AllTrim(Str(nNum3)) + ". O maior deles e: "

if nNum1 > nNum2
    if nNum1 > nNum3
        nMaior := nNum1
    else
        nMaior := nNum3
    endif
elseif nNum2 > nNum3
    nMaior := nNum2
else
    nMaior := nNum3
endif


cMensagem := cMensagem + AllTrim(Str(nMaior))
    
@ 07,04 say cMensagem

@ 15,04 say ""