# language: pt
# encode: UTF-8

@satisfacao
Funcionalidade:  Usuario responde a pesquisa de satisfação

@satisfacao1
Esquema do Cenario: Usuario responde a pesquisa de satisfacao com uma nota baixa
     Dado que acessei o chatboot ate o fluxo "Pesquisa de satisfação" 
     Quando visualizo a mensagem "Atendimento" seleciono a opcao <opcao> visualizo a mensagem <mensagem> preencho o campo <sugestao>
     Então valido que fui direcionado ao fluxo "Fim do chat 4"
 
 Exemplos:
 | opcao           | mensagem                                                                                                                      | sugestao                            |
 | "1 - Ruim"      | "Poxa! 😿 Vamos nos esforçar para melhorar suas próximas experiências conosco. Gostaria de deixar um comentário ou sugestão?" | "Estou adorando isso!"              |
 | "2 - Razoável"  | "Poxa! 😿 Vamos nos esforçar para melhorar suas próximas experiências conosco. Gostaria de deixar um comentário ou sugestão?" | "Show!"                             |
 | "3 - Bom"       | "Opa! Muito obrigada pela nota! 😺 Gostaria de deixar um comentário ou sugestão?"                                             | "É lindo de ver o robo trabalhando!"|
 | "4 - Muito bom" | "Opa! Muito obrigada pela nota! 😺 Gostaria de deixar um comentário ou sugestão?"                                             | "Só a agradeçer!"                   |
 | "5 - Excelente" | "Opa! Muito obrigada pela nota! 😺 Gostaria de deixar um comentário ou sugestão?"                                             | "Bacana demais!"                    |
