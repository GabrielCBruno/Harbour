//set color to "b/g". Se for digitado antes do clear a cor do fundo sera altarada tambem. Ja se for depois, sera alterado a cor do fundo apenas na linha.

clear

set color to "b/g" // Tem a funcao de alterar a cor geral da fonte e a cor do fundo. Letra/Fundo

@ 01,01 say "Testando a alteracao de cor da fonte e fundo." 
@ 03,01 say "Testando alteracoes na cores." color "r/b" 

set color to "r/w"

@ 05,01 say "Terceira frase de teste" 
@ 06,01 say "Quarta frase de teste." 

@ 10,01 say ""