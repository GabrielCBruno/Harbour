// Gabriel Henrique Cavalin Bruno

clear 

set date brit
set epoch to 1940
set century on 

// Variaveis

dAtual              := Date()

cNomeAluno          := Space(50)
dNascimento         := CTod('')
cCurso              := Space(45)
nSerie              := 0
nMensalidade        := 0
lAprovado           := .t.
nMedia              := 0
nSoma               := 0

cDisc1              := Space(20)
nDisc1Nota1         := 0
nDisc1Nota2         := 0
nDisc1Nota3         := 0
nDisc1Nota4         := 0
nDisc1Falta1        := 0
nDisc1Falta2        := 0
nDisc1Falta3        := 0
nDisc1Falta4        := 0

cDisc2              := Space(20)
nDisc2Nota1         := 0
nDisc2Nota2         := 0
nDisc2Nota3         := 0
nDisc2Nota4         := 0
nDisc2Falta1        := 0
nDisc2Falta2        := 0
nDisc2Falta3        := 0
nDisc2Falta4        := 0

cDisc3              := Space(20)
nDisc3Nota1         := 0
nDisc3Nota2         := 0
nDisc3Nota3         := 0
nDisc3Nota4         := 0

nDisc3Falta1        := 0
nDisc3Falta2        := 0
nDisc3Falta3        := 0
nDisc3Falta4        := 0

@ 02,01 say "Digite o nome do aluno..............:"
@ 03,01 say "Digite a data de nascimento.........:"
@ 04,01 say "Digite o nome do curso..............:"
@ 05,01 say "Digite a serie atual................:"
@ 06,01 say "Digite o valor da mensalidade.......:"

@ 02,39 get cNomeAluno   picture "@!"        valid !Empty(cNomeAluno)
@ 03,39 get dNascimento                      valid !Empty(dNascimento) .and. dNascimento < dAtual
@ 04,39 get cCurso       picture "@!"        valid !Empty(cCurso)
@ 05,39 get nSerie       picture "9"         valid !Empty(nSerie) .and. nSerie >= 1 .and. nSerie <= 8
@ 06,39 get nMensalidade picture "@E 999.99" valid !Empty(nMensalidade)
read

@ 08,01 say "Digite o nome da primeira disciplina:"
@ 09,01 say "Digite o nome da segunda disciplina.:"
@ 10,01 say "Digite o nome da terceira disciplina:"

@ 08,39 get cDisc1 picture "@!" valid !Empty(cDisc1)
@ 09,39 get cDisc2 picture "@!" valid !Empty(cDisc2) .and. cDisc2 != cDisc1
@ 10,39 get cDisc3 picture "@!" valid !Empty(cDisc3) .and. cDisc3 != cDisc2 .and. cDisc3 != cDisc1
read

clear

@ 03,01 say "Disciplinas"

@ 03,16 say "1"
@ 03,20 say "Faltas"

@ 03,28 say "2"
@ 03,30 say "Faltas"

@ 03,38 say "3"
@ 03,41 say "Faltas"

@ 03,49 say "4"
@ 03,50 say "Faltas"

@ 03,60 say "Media"

//Disciplina 1

@ 04,04 say AllTrim(cDisc1)
@ 04,15 get nDisc1Nota1  picture "999" valid nDisc1Nota1 >= 0  .and. nDisc1Nota1 <= 100 //Nota 1
@ 04,21 get nDisc1Falta1 picture "99"  valid nDisc1Falta1 >= 0 .and. nDisc1Falta1 <= 20  //Faltas
read

nSoma := nSoma + nDisc1Nota1

@ 04,27 get nDisc1Nota2  picture "999" valid nDisc1Nota2 >= 0  .and. nDisc1Nota2 <= 100 //Nota 2
@ 04,32 get nDisc1Falta2 picture "99"  valid nDisc1Falta2 >= 0 .and. nDisc1Falta2 <= 20  //Faltas
read

nSoma := nSoma + nDisc1Nota2

@ 04,37 get nDisc1Nota3  picture "999" valid nDisc1Nota3 >= 0  .and. nDisc1Nota3 <= 100 //Nota 3
@ 04,42 get nDisc1Falta3 picture "99"  valid nDisc1Falta3 >= 0 .and. nDisc1Falta3 <= 20  //Faltas
read

nSoma := nSoma + nDisc1Nota3

@ 04,47 get nDisc1Nota4  picture "999" valid nDisc1Nota4>= 0   .and. nDisc1Nota4<= 100 //Nota 4
@ 04,52 get nDisc1Falta4 picture "99"  valid nDisc1Falta4 >= 0 .and. nDisc1Falta4 <= 20  //Faltas
read

nSoma := nSoma + nDisc1Nota4

nMedia := nSoma/4

if nSerie <= 3
    if nDisc1Falta1 > 6 .or. nDisc1Falta2 > 6 .or. nDisc1Falta3 > 6 .or. nDisc1Falta4 > 6
        lAprovado := .f.
    endif
else
    if nDisc1Falta1 > 8 .or. nDisc1Falta2 > 8 .or. nDisc1Falta3 > 8 .or. nDisc1Falta4 > 8
        lAprovado := .f.
    endif
endif

if nSerie <= 4
    if nMedia >= 60 
        @ 04,59 say AllTrim(Transform(nMedia, "@E 999.9")) color "g/n"
    else
        @ 04,59 say AllTrim(Transform(nMedia, "@E 999.9")) color "r/n"
        lAprovado := .f.
    endif
 else
     if nMedia >= 70
        @ 04,59 say AllTrim(Transform(nMedia, "@E 999.9")) color "g/n"
    else
        @ 04,59 say AllTrim(Transform(nMedia, "@E 999.9")) color "r/n"
        lAprovado := .f.
     endif
endif

if lAprovado == .f. 
    @ 04,65 say "COM DEPENCIA"    color "r/n"
else
    @ 04,65 say "SEM DEPENDENCIA" color "g/n"
endif

//Disciplina 2

nSoma := 0

@ 06,04 say AllTrim(cDisc2)
@ 06,15 get nDisc2Nota1  picture "999" valid nDisc2Nota1 >= 0  .and. nDisc2Nota1 <= 100 //Nota 1
@ 06,21 get nDisc2Falta1 picture "99"  valid nDisc2Falta1 >= 0 .and. nDisc2Falta1 <= 20  //Faltas
read

nSoma := nSoma + nDisc2Nota1

@ 06,27 get nDisc2Nota2  picture "999" valid nDisc2Nota2 >= 0  .and. nDisc2Nota2 <= 100 //Nota 2
@ 06,32 get nDisc2Falta2 picture "99"  valid nDisc2Falta2 >= 0 .and. nDisc2Falta2 <= 20  //Faltas
read

nSoma := nSoma + nDisc2Nota2

@ 06,37 get nDisc2Nota3  picture "999" valid nDisc2Nota3 >= 0  .and. nDisc2Nota3 <= 100 //Nota 3
@ 06,42 get nDisc2Falta3 picture "99"  valid nDisc2Falta3 >= 0 .and. nDisc2Falta3 <= 20  //Faltas
read

nSoma := nSoma + nDisc2Nota3

@ 06,47 get nDisc2Nota4  picture "999" valid nDisc2Nota4>= 0   .and. nDisc2Nota4<= 100 //Nota 4
@ 06,52 get nDisc2Falta4 picture "99"  valid nDisc2Falta4 >= 0 .and. nDisc2Falta4 <= 20  //Faltas
read

nSoma := nSoma + nDisc2Nota4

nMedia := nSoma/4

if nSerie <= 3
    if nDisc2Falta1 > 6 .or. nDisc2Falta2 > 6 .or. nDisc2Falta3 > 6 .or. nDisc2Falta4 > 6
        lAprovado := .f.
    endif
else
    if nDisc2Falta1 > 8 .or. nDisc2Falta2 > 8 .or. nDisc2Falta3 > 8 .or. nDisc2Falta4 > 8
        lAprovado := .f.
    endif
endif

if nSerie <= 4
    if nMedia >= 60
        @ 06,59 say "" + AllTrim(Transform(nMedia, "@E 999.9")) color "g/n"
    else
        @ 06,59 say "" + AllTrim(Transform(nMedia, "@E 999.9")) color "r/n"
        lAprovado := .f.
    endif
 else
     if nMedia >= 70
        @ 06,59 say "" + AllTrim(Transform(nMedia, "@E 999.9")) color "g/n"
    else
        @ 06,59 say "" + AllTrim(Transform(nMedia, "@E 999.9")) color "r/n"
        lAprovado := .f.
     endif
endif

if lAprovado == .f. 
    @ 06,65 say "COM DEPENCIA"    color "r/n"
else
    @ 06,65 say "SEM DEPENDENCIA" color "g/n"
endif

//Disciplina 3

nSoma := 0

@ 08,04 say AllTrim(cDisc3)
@ 08,15 get nDisc3Nota1  picture "999" valid nDisc3Nota1 >= 0  .and. nDisc3Nota1 <= 100 //Nota 1
@ 08,21 get nDisc3Falta1 picture "99"  valid nDisc3Falta1 >= 0 .and. nDisc3Falta1 <= 20  //Faltas
read

nSoma := nSoma + nDisc3Nota1

@ 08,27 get nDisc3Nota2  picture "999" valid nDisc3Nota2 >= 0  .and. nDisc3Nota2 <= 100 //Nota 2
@ 08,32 get nDisc3Falta2 picture "99"  valid nDisc3Falta2 >= 0 .and. nDisc3Falta2 <= 20  //Faltas
read

nSoma := nSoma + nDisc3Nota2

@ 08,37 get nDisc3Nota3  picture "999" valid nDisc3Nota3 >= 0  .and. nDisc3Nota3 <= 100 //Nota 3
@ 08,42 get nDisc3Falta3 picture "99"  valid nDisc3Falta3 >= 0 .and. nDisc3Falta3 <= 20  //Faltas
read

nSoma := nSoma + nDisc3Nota3

@ 08,47 get nDisc3Nota4  picture "999" valid nDisc3Nota4>= 0   .and. nDisc3Nota4<= 100 //Nota 4
@ 08,52 get nDisc3Falta4 picture "99"  valid nDisc3Falta4 >= 0 .and. nDisc3Falta4 <= 20  //Faltas
read

nSoma := nSoma + nDisc3Nota4

nMedia := nSoma/4

if nSerie <= 3
    if nDisc3Falta1 > 6 .or. nDisc3Falta2 > 6 .or. nDisc3Falta3 > 6 .or. nDisc3Falta4 > 6
        lAprovado := .f.
    endif
else
    if nDisc3Falta1 > 8 .or. nDisc3Falta2 > 8 .or. nDisc3Falta3 > 8 .or. nDisc3Falta4 > 8
        lAprovado := .f.
    endif
endif

if nSerie <= 4
    if nMedia >= 60
        @ 08,59 say "" + AllTrim(Transform(nMedia, "@E 999.9")) color "g/n"
    else
        @ 08,59 say "" + AllTrim(Transform(nMedia, "@E 999.9")) color "r/n"
        lAprovado := .f.
    endif
 else
     if nMedia >= 70
        @ 08,59 say "" + AllTrim(Transform(nMedia, "@E 999.9")) color "g/n"
    else
        @ 08,59 say "" + AllTrim(Transform(nMedia, "@E 999.9")) color "r/n"
        lAprovado := .f.
     endif
endif

if lAprovado == .f. 
    @ 08,65 say "COM DEPENCIA"    color "r/n"
else
    @ 08,65 say "SEM DEPENDENCIA" color "g/n"
endif
 

@ 15,01 say ""