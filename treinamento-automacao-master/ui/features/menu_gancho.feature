# language: pt
# encode: UTF-8

@menugancho
Funcionalidade: Usuario é direcionado ao menu gancho ou retorna ao menu inicial

@menugancho1
Cenário: Usuario seleciona a opção Não e é direcionado ao fluxo Pesquisa de satisfacao
    Dado que acessei o chatboot ate o fluxo "Fluxo menu gancho"
    Quando seleciono a opção "NÃO" visualizo a mensagem "Feliz"
    Então valido que fui direcionado ao fluxo "Pesquisa de satisfacao"

@menugancho2
Cenário: Usuario seleciona a opção Sim e é direcinando ao fluxo Deseja falar 
    Dado que acessei o chatboot ate o fluxo "Fluxo menu gancho"
    Então seleciono a opção "SIM" valido que visualizo "Deseja falar"
