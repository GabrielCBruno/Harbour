// Gabriel Henrique Cavalin Bruno

clear 

set date brit
set epoch to 1940
set century on 

// Variaveis

dAtual              := Date()

cNomeAluno          := Space(25)
dNascimento         := CTod('')
cCurso              := Space(25)
nSerie              := 0
nMensalidade        := 0
lAprovado           := .t.
nMedia              := 0
nSoma               := 0
nDependencias       := 0
cCor                := Space(3)
cStatus             := Space(10) 

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

@ 00,01 say "Escola Eduardo Machado"
@ 01,01 say "Rua das Rosas n 1200 - Jardim Primavera"
@ 02,01 say "(44) 91234-56789"
@ 03,00 to 03,80 double

@ 04,01 say "Digite o nome do aluno..............:"
@ 05,01 say "Digite a data de nascimento.........:"
@ 06,01 say "Digite o nome do curso..............:"
@ 07,01 say "Digite a serie atual................:"
@ 08,01 say "Digite o valor da mensalidade.......:"

@ 04,39 get cNomeAluno   picture "@!"        valid !Empty(cNomeAluno)
@ 05,39 get dNascimento                      valid !Empty(dNascimento) .and. dNascimento < dAtual
@ 06,39 get cCurso       picture "@!"        valid !Empty(cCurso)
@ 07,39 get nSerie       picture "9"         valid nSerie >= 1 .and. nSerie <= 8
@ 08,39 get nMensalidade picture "@E 999.99" valid !Empty(nMensalidade)
read

@ 10,01 say "Digite o nome da primeira disciplina:"
@ 11,01 say "Digite o nome da segunda disciplina.:"
@ 12,01 say "Digite o nome da terceira disciplina:"

@ 10,39 get cDisc1 picture "@!" valid !Empty(cDisc1)
@ 11,39 get cDisc2 picture "@!" valid !Empty(cDisc2) .and. cDisc2 != cDisc1
@ 12,39 get cDisc3 picture "@!" valid !Empty(cDisc3) .and. cDisc3 != cDisc2 .and. cDisc3 != cDisc1
read

@ 09,01 clear to 25,80
@ 10,00 to 10,80 double

@ 11,01 say "Disciplinas"

@ 11,16 say "1"
@ 11,20 say "Faltas"

@ 11,28 say "2"
@ 11,30 say "Faltas"

@ 11,38 say "3"
@ 11,41 say "Faltas"

@ 11,49 say "4"
@ 11,50 say "Faltas"

@ 11,58 say "Media"

//Disciplina 1

@ 12,04 say AllTrim(cDisc1)
@ 12,15 get nDisc1Nota1  picture "999" valid nDisc1Nota1 >= 0  .and. nDisc1Nota1 <= 100 //Nota 1
@ 12,21 get nDisc1Falta1 picture "99"  valid nDisc1Falta1 >= 0 .and. nDisc1Falta1 <= 20  //Faltas
read

nSoma := nSoma + nDisc1Nota1

@ 12,27 get nDisc1Nota2  picture "999" valid nDisc1Nota2 >= 0  .and. nDisc1Nota2 <= 100 //Nota 2
@ 12,32 get nDisc1Falta2 picture "99"  valid nDisc1Falta2 >= 0 .and. nDisc1Falta2 <= 20  //Faltas
read

nSoma := nSoma + nDisc1Nota2

@ 12,37 get nDisc1Nota3  picture "999" valid nDisc1Nota3 >= 0  .and. nDisc1Nota3 <= 100 //Nota 3
@ 12,42 get nDisc1Falta3 picture "99"  valid nDisc1Falta3 >= 0 .and. nDisc1Falta3 <= 20  //Faltas
read

nSoma := nSoma + nDisc1Nota3

@ 12,47 get nDisc1Nota4  picture "999" valid nDisc1Nota4>= 0   .and. nDisc1Nota4<= 100 //Nota 4
@ 12,52 get nDisc1Falta4 picture "99"  valid nDisc1Falta4 >= 0 .and. nDisc1Falta4 <= 20  //Faltas
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
        cCor := "g/n"
    else
        cCor := "r/n"
        lAprovado := .f.
    endif
 else
     if nMedia >= 70
        cCor := "g/n"
    else
        cCor := "r/n"
        lAprovado := .f.
     endif
endif

@ 12,58 say AllTrim(Transform(nMedia, "@E 999.9")) color cCor

if lAprovado == .f. 
    @ 12,64 say "COM DEPENDENCIA" color "r/n"
    nDependencias := nDependencias + 1
else
    @ 12,64 say "SEM DEPENDENCIA" color "g/n"
endif

//Disciplina 2

nSoma     := 0
lAprovado := .t.

@ 14,04 say AllTrim(cDisc2)
@ 14,15 get nDisc2Nota1  picture "999" valid nDisc2Nota1 >= 0  .and. nDisc2Nota1 <= 100 //Nota 1
@ 14,21 get nDisc2Falta1 picture "99"  valid nDisc2Falta1 >= 0 .and. nDisc2Falta1 <= 20  //Faltas
read

nSoma := nSoma + nDisc2Nota1

@ 14,27 get nDisc2Nota2  picture "999" valid nDisc2Nota2 >= 0  .and. nDisc2Nota2 <= 100 //Nota 2
@ 14,32 get nDisc2Falta2 picture "99"  valid nDisc2Falta2 >= 0 .and. nDisc2Falta2 <= 20  //Faltas
read

nSoma := nSoma + nDisc2Nota2

@ 14,37 get nDisc2Nota3  picture "999" valid nDisc2Nota3 >= 0  .and. nDisc2Nota3 <= 100 //Nota 3
@ 14,42 get nDisc2Falta3 picture "99"  valid nDisc2Falta3 >= 0 .and. nDisc2Falta3 <= 20  //Faltas
read

nSoma := nSoma + nDisc2Nota3

@ 14,47 get nDisc2Nota4  picture "999" valid nDisc2Nota4>= 0   .and. nDisc2Nota4<= 100 //Nota 4
@ 14,52 get nDisc2Falta4 picture "99"  valid nDisc2Falta4 >= 0 .and. nDisc2Falta4 <= 20  //Faltas
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
        cCor := "g/n"
    else
        cCor := "r/n"
        lAprovado := .f.
    endif
 else
     if nMedia >= 70
        cCor := "g/n"
    else
        cCor := "r/n"
        lAprovado := .f.
     endif
endif

@ 14,58 say AllTrim(Transform(nMedia, "@E 999.9")) color cCor

if lAprovado == .f. 
    @ 14,64 say "COM DEPENDENCIA" color "r/n"
    nDependencias := nDependencias + 1
else
    @ 14,64 say "SEM DEPENDENCIA" color "g/n"
endif

//Disciplina 3

nSoma := 0
lAprovado := .t.

@ 16,04 say AllTrim(cDisc3)
@ 16,15 get nDisc3Nota1  picture "999" valid nDisc3Nota1 >= 0  .and. nDisc3Nota1 <= 100 //Nota 1
@ 16,21 get nDisc3Falta1 picture "99"  valid nDisc3Falta1 >= 0 .and. nDisc3Falta1 <= 20  //Faltas
read

nSoma := nSoma + nDisc3Nota1

@ 16,27 get nDisc3Nota2  picture "999" valid nDisc3Nota2 >= 0  .and. nDisc3Nota2 <= 100 //Nota 2
@ 16,32 get nDisc3Falta2 picture "99"  valid nDisc3Falta2 >= 0 .and. nDisc3Falta2 <= 20  //Faltas
read

nSoma := nSoma + nDisc3Nota2

@ 16,37 get nDisc3Nota3  picture "999" valid nDisc3Nota3 >= 0  .and. nDisc3Nota3 <= 100 //Nota 3
@ 16,42 get nDisc3Falta3 picture "99"  valid nDisc3Falta3 >= 0 .and. nDisc3Falta3 <= 20  //Faltas
read

nSoma := nSoma + nDisc3Nota3

@ 16,47 get nDisc3Nota4  picture "999" valid nDisc3Nota4>= 0   .and. nDisc3Nota4<= 100 //Nota 4
@ 16,52 get nDisc3Falta4 picture "99"  valid nDisc3Falta4 >= 0 .and. nDisc3Falta4 <= 20  //Faltas
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
        cCor := "g/n"
    else
        cCor := "r/n"
        lAprovado := .f.
    endif
 else
     if nMedia >= 70
        cCor := "g/n"
    else
        cCor := "r/n"
        lAprovado := .f.
     endif
endif

@ 16,58 say AllTrim(Transform(nMedia, "@E 999.9")) color cCor

if lAprovado == .f. 
    @ 16,64 say "COM DEPENDENCIA" color "r/n"
    nDependencias := nDependencias + 1
else
    @ 16,64 say "SEM DEPENDENCIA" color "g/n"
endif

// Resultado Final

if nDependencias < 3 .and. nDependencias > 0
    cStatus := "APROVADO com " + AllTrim(Str(nDependencias)) + " dependencia."
    cCor    := "r/n"
elseif nDependencias = 0
    cStatus := "APROVADO sem dependencia."
    cCor    := "g/n"
else
    cStatus := "REPROVADO."
    cCor    := "r/n"
endiF

@ 17,00 to 17,80 double

@ 18,40 say "STATUS: " + cStatus color cCor

if nDependencias = 1
    nMensalidade := nMensalidade + (nMensalidade * 0.2)
elseif nDependencias = 2
    nMensalidade := nMensalidade + (nMensalidade * 0.4)
endif

@ 20,04 say "Valor da nova mensalidade: " + AllTrim(Transform(nMensalidade, "@E 999.99"))
Inkey(0)

@ 22,01 say ""