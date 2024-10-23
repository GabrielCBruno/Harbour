clear 

nIdade := 0

@ 01,01 to 10,40

@ 02,03 say "Digite a idade: "

@ 02,19 get nIdade picture "999" valid nIdade > 0 .and. nIdade <= 120
read

if nIdade > 21
    @ 04,03 say "Voce tem mais de 21 anos"
else
    if nIdade = 21
        @ 04,03 say "Voce tem 21 anos"
    else
        @ 04,03 say "Voce nao tem mais de 21 anos"
    endif
endif

@ 12,01 say ""