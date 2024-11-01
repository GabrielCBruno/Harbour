clear 

dAtual    := Date()
cMensagem := Space(25)

Alert(Str(LastDayOM(dAtual, Month(dAtual))))

// cMensagem := "Maringa " + AllTrim(Str(Day(dAtual)))

// if Month(dAtual) = 01
//     cMensagem := cMensagem + " Janeiro de " + AllTrim(Str(Year(dAtual)))
// elseif Month(dAtual) = 02
//     cMensagem := cMensagem + " Fevereiro de " + AllTrim(Str(Year(dAtual)))
// elseif Month(dAtual) = 03
//     cMensagem := cMensagem + " Marco de " + AllTrim(Str(Year(dAtual)))
// elseif Month(dAtual) = 04
//     cMensagem := cMensagem + " Abril de " + AllTrim(Str(Year(dAtual)))
// elseif Month(dAtual) = 05
//     cMensagem := cMensagem + " Maio de " + AllTrim(Str(Year(dAtual)))
// elseif Month(dAtual) = 06
//     cMensagem := cMensagem + " Junho de " + AllTrim(Str(Year(dAtual)))
// elseif Month(dAtual) = 07
//     cMensagem := cMensagem + " Julho de " + AllTrim(Str(Year(dAtual)))
// elseif Month(dAtual) = 08
//     cMensagem := cMensagem + " Agosto de " + AllTrim(Str(Year(dAtual)))
// elseif Month(dAtual) = 09
//     cMensagem := cMensagem + " Setembro de " + AllTrim(Str(Year(dAtual)))
// elseif Month(dAtual) = 10
//     cMensagem := cMensagem + " Outubro de " + AllTrim(Str(Year(dAtual)))
// elseif Month(dAtual) = 11
//     cMensagem := cMensagem + " Novembro de " + AllTrim(Str(Year(dAtual)))
// elseif Month(dAtual) = 12
//     cMensagem := cMensagem + " Dezembro de " + AllTrim(Str(Year(dAtual)))
// endif

// if Dow(dAtual) = 1
//     cMensagem := cMensagem + " - Dia da semana: Domingo"
// elseif Dow(dAtual) = 2
//     cMensagem := cMensagem + " - Dia da semana: Segunda-Feira"
// elseif Dow(dAtual) = 3
//     cMensagem := cMensagem + " - Dia da semana: Terca-Feira"
// elseif Dow(dAtual) = 4
//     cMensagem := cMensagem + " - Dia da semana: Quarta-Feira"
// elseif Dow(dAtual) = 5
//     cMensagem := cMensagem + " - Dia da semana: Quinta-Feira"
// elseif Dow(dAtual) = 6
//     cMensagem := cMensagem + " - Dia da semana: Sexta-Feira"
// elseif Dow(dAtual) = 7
//     cMensagem := cMensagem + " - Dia da semana: Sabado"
// endif

//@ 01,04 say cMensagem