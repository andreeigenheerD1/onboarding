# language: pt
# encode: UTF-8

@nao_recebi_cartao
Funcionalidade: Solicitando um novo envio de cartão

@nao_recebi_cartao1
Cenario: Usuario solicita o envio de uma nova tentativa de entrega de cartão, com cep inválido tres vezes
    Dado que acessei o chatboot ate o fluxo "Nao recebi meu cartao"
    Quando informo o dado "cpf_invalido" invalido por tres vezes
    Então valido que fui direcionado ao fluxo "Fim do chat recebimento" 
    

@nao_recebi_cartao2
Esquema do Cenario: Usuario solicita uma nova tentativa de entrega do cartão com cep válido e entrega em dia util
    Dado que acessei o chatboot ate o fluxo "Nao recebi meu cartao"
    Quando informo o dado "cpf_cadastrado" seleciono a opcao "SIM" seleciono a opcao <dia> seleciono a opcao <periodo>
    Então valido que fui direcionado ao fluxo "Pesquisa de satisfacao" 

Exemplos:
|dia              | periodo |
| "Segunda-feira" |"Tarde"  | 
| "Terça-feira"   |"Manhã"  |
| "Quarta-feira"  |"Tarde"  |
| "Quinta-feira"  |"Manhã"  |
| "Sexta-feira"   |"Tarde"  |

@nao_recebi_cartao3
Cenario: Usuario solicita uma nova tentativa de entrega do cartão com cep válido e entrega ao sábado
    Dado que acessei o chatboot ate o fluxo "Nao recebi meu cartao"
    Quando informo o dado "cpf_cadastrado" seleciono a opcao "SIM" seleciono a opcao "dia" 
    Então valido que fui direcionado ao fluxo "Pesquisa de satisfacao" 

@nao_recebi_cartao4
Cenario: Usuario solicita uma nova tentativa de entrega para outro endereço
    Dado que acessei o chatboot ate o fluxo "Nao recebi meu cartao"
    E informo o dado "cpf_cadastrado" seleciono a opcao "Não"
    E informo o dado "novo_endereco" seleciono a opcao "SIM" informo o dado "novo_endereco" seleciono a opcao "SIM" informo o dado "novo_endereco"
    Quando seleciono a opcao "SIM"
    Então valido que fui direcionado ao fluxo "Escolha"

@nao_recebi_cartao5
Cenario: Usuario solicita uma nova tentativa de entrega para outro endereço e nao confirma o endereco
    Dado que acessei o chatboot ate o fluxo "Nao recebi meu cartao"
    E informo o dado "cpf_cadastrado" seleciono a opcao "Não"
    E informo o dado "novo_endereco" seleciono a opcao "SIM" informo o dado "novo_endereco" seleciono a opcao "SIM" informo o dado "novo_endereco"
    Quando seleciono a opcao "NÃO"
    Então valido que fui direcionado ao fluxo "Informe endereco"    

@nao_recebi_cartao6
Cenario: Usuario solicita uma nova tentativa de entrega para outro endereco com cep invalido tres vezes
    Dado que acessei o chatboot ate o fluxo "Nao recebi meu cartao"
    E informo o dado "cpf_cadastrado" seleciono a opcao "Não"
    Quando informo o dado "cpf_invalido" invalido por tres vezes
    Então valido que fui direcionado ao fluxo "Fim do chat recebimento" 