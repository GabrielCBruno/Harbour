set date brit 
set epoch to 1940

clear

@ 00,00 to 10,60 double

do while .t.

    @ 01,01 clear to 09,59

    nNum1 := 0
    nNum2 := 0

    @ 01,02 say "Digite o numero 1:"
    @ 02,02 say "Digite o numero 2:"

    @ 01,23 get nNum1 picture "99" valid !Empty(nNum1)
    @ 02,23 get nNum2 picture "99" valid !Empty(nNum2)
    read

    if LastKey() == 27 //Ultima tecla digitada pelo usuario
        exit // Sair do programa.
    endif

    @ 03,01 say "O resultado do produto entre os numeros" + AllTrim(Str(nNum1)) + " e " + AllTrim(Str(nNum2)) + " e: " + nNum1 * nNum2

enddo