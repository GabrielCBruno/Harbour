clear

do while .t.

    cNome         := Space(20)
    nIdade        := 0
    nPeso         := 0
    cMensagemErro := "Tem certeza que deseja sair ?"

    @ 01,01 to 15,45

    @ 02,15 say "Formulario"
    @ 04,04 say "Digite o nome.: "
    @ 05,04 say "Digite a idade: "
    @ 06,04 say "Digite o peso.: "

    @ 04,20 get cNome  picture "@!"        valid !Empty(cNome) //picture "@!" faz com que a string fique MAISCúLA.
    @ 05,20 get nIdade picture "999"       valid nIdade > 0 .and. nIdade <= 120
    @ 06,20 get nPeso  picture "@E 999.99" valid nPeso > 0 .and. nPeso < 130
    read 

    if LastKey() == 27 // Ultima tecla digitada. 27 = ESC
        nOpcao := Alert(cMensagemErro, {'Sim', 'Nao'}) // Gera uma mensagem para o usuario
        if nOpcao == 1
            exit
        endif
        loop
    endif

    @ 08,15 say "Impressoes"
    @ 10,04 say "Nome.: " + AllTrim(cNome)
    @ 11,04 say "Idade: " + AllTrim(Str(nIdade))
    @ 12,04 say "Peso.: " + AllTrim(Transform(nPeso, "@E 999.99"))

enddo

@ 15,01 say ""