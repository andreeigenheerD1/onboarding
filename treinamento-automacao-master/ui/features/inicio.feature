# language: pt
# encode: UTF-8

@inicio
Funcionalidade:  solicitando um cartão adicional
 
@inicio1
Cenário: Usuário seleciona a opção não e é encaminhado ao final do chat
    Dado que acessei o chatboot ate o fluxo "Inicio"
    E visualizo o menu "Menu inicial"
    Quando seleciono a opção "NÃO" visualizo a mensagem "Proposta"
    Então valido que fui direcionado ao fluxo "Fim do chat 1"

@inicio2
Cenário: Usuário seleciona a opçãp sim e é encaminhado para o menu solicitações
    Dado que acessei o chatboot ate o fluxo "Inicio"
    Quando visualizo o menu "Menu inicial" seleciono a opção "SIM" visualizo a mensagem "Cpf"
    E informo o dado "cpf_cadastrado" visualizo a mensagem "Boas vindas" visualizo a mensagem "Importante" 
    Quando visualizar o menu "Deseja falar" seleciono a opção "Solicitar adicional" visualizo a mensagem "Solicitacoes"
    Então valido que fui direcionado ao fluxo "Menu gancho"

@inicio3
Cenário: Usuário seleciona a opção sim e é encaminhado para o menu nao recebimento
    Dado que acessei o chatboot ate o fluxo "Inicio"
    Quando visualizo o menu "Menu inicial" seleciono a opção "SIM" visualizo a mensagem "Cpf"
    E informo o dado "cpf_cadastrado" visualizo a mensagem "Boas vindas" visualizo a mensagem "Importante" 
    Quando visualizar o menu "Deseja falar" seleciono a opção "Não recebi meu cartão" 
    Então valido que fui direcionado ao fluxo "Inicio nao recebi meu cartao"

@inicio4
Cenário: Usuário seleciona a opção sim e é encaminhado para o menu de limites
    Dado que acessei o chatboot ate o fluxo "Inicio"
    Quando visualizo o menu "Menu inicial" seleciono a opção "SIM" visualizo a mensagem "Cpf"
    E informo o dado "cpf_cadastrado" visualizo a mensagem "Boas vindas" visualizo a mensagem "Importante" 
    Quando visualizar o menu "Deseja falar" seleciono a opção "Limite" visualizo a mensagem "Sobre limite"
    Então valido que fui direcionado ao fluxo "Menu gancho"

@inicio5
Cenário: Usuário seleciona a opção sim e é encaminhado para o menu de faturas
    Dado que acessei o chatboot ate o fluxo "Inicio"
    Quando visualizo o menu "Menu inicial" seleciono a opção "SIM" visualizo a mensagem "Cpf"
    E informo o dado "cpf_cadastrado" visualizo a mensagem "Boas vindas" visualizo a mensagem "Importante" 
    Quando visualizar o menu "Deseja falar" seleciono a opção "Fatura" visualizo a mensagem "fatura"
    Então valido que fui direcionado ao fluxo "Menu gancho"

@inicio6
Cenário: Usuário seleciona a opção sim e é encaminhado para o menu outros assuntos
    Dado que acessei o chatboot ate o fluxo "Inicio"
    Quando visualizo o menu "Menu inicial" seleciono a opção "SIM" visualizo a mensagem "Cpf"
    E informo o dado "cpf_cadastrado" visualizo a mensagem "Boas vindas" visualizo a mensagem "Importante" 
    Quando visualizar o menu "Deseja falar" seleciono a opção "Outros assuntos" visualizo a mensagem "Sobre outros"
    Então valido que fui direcionado ao fluxo "Menu gancho"   

@inicio7
Cenário: Usuário seleciona a opção sim e insere um cpf inválido e depois um cpf válido
    Dado que acessei o chatboot ate o fluxo "Inicio"
    Quando visualizo o menu "Menu inicial" seleciono a opção "SIM" visualizo a mensagem "Cpf"
    E informo o dado "cpf_invalido" visualizo a mensagem "Tentativa1" visualizo a mensagem "Tentativa2"
    Quando visualizo a mensagem "Cpf" informo o dado "cpf_cadastrado"
    Então valido que fui direcionado ao fluxo "Boas vindas" 

@inicio8
Cenário: Usuário seleciona a opção sim e insere cpf inválido em todas as tentativas permitidas
  Dado que acessei o chatboot ate o fluxo "Inicio"
  Quando visualizo o menu "Menu inicial" seleciono a opção "SIM" visualizo a mensagem "Cpf"
  E informo o dado "cpf_invalido" visualizo a mensagem "Tentativa1" visualizo a mensagem "Tentativa2"
  Quando informo o dado "cpf_invalido"
  Então valido que fui direcionado ao fluxo "Fim do chat 2" 

@inicio9
Cenário: Usuário seleciona a opção sim, insere um cpf válido que não consta na base de dados
    Dado que acessei o chatboot ate o fluxo "Inicio"
    Quando visualizo o menu "Menu inicial" seleciono a opção "SIM" visualizo a mensagem "Cpf"
    E informo o dado "cpf_valido" visualizo a mensagem "Nao inserido" a mensagem "Proposta"
    Então valido que fui direcionado ao fluxo "Fim do chat 1"










    

