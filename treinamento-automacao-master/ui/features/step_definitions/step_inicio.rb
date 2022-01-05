Dado("que acessei o chatboot ate o fluxo {string}") do |fluxo1|
    Comum.new.login_web
    Comum.new.iniciando_filmagem
    Fluxo.new.redirecionamento_fluxo(fluxo1)
    
end
  
Dado("visualizo o menu {string}") do |menu1|
    Fluxo.new.validacao_fluxo(menu1)
end
  
Quando("seleciono a opção {string} visualizo a mensagem {string}") do |opcao1, mensagem1|
    Comum.new.clicar_pesquisa(opcao1)
    Fluxo.new.validacao_fluxo(mensagem1)
end
  
Então("valido que fui direcionado ao fluxo {string}") do |fluxo1|
    Fluxo.new.validacao_fluxo(fluxo1)
    Comum.new.encerrando_filmagem
end

# inicio2
Dado("visualizo o menu {string} seleciono a opção {string} visualizo a mensagem {string}") do |menu1, opcao1, mensagem1|
    Fluxo.new.validacao_fluxo(menu1)
    Comum.new.clicar_pesquisa(opcao1)
    Fluxo.new.validacao_fluxo(mensagem1)
end

# Estão diferentes pq o codigo muda a função

Quando("visualizar o menu {string} seleciono a opção {string} visualizo a mensagem {string}") do |menu1, opcao1, mensagem1|
    Fluxo.new.validacao_fluxo(menu1)
    Comum.new.selecionar_opcao(opcao1)
    Fluxo.new.validacao_fluxo(mensagem1)
end   
  
Quando("informo o dado {string} visualizo a mensagem {string} visualizo a mensagem {string}") do |dado1, mensagem1, mensagem2|
    Comum.new.preenche_campo(MASSA[dado1]["cpf"])
    Comum.new.clica_enviar
    Fluxo.new.validacao_fluxo(mensagem1)
    Fluxo.new.validacao_fluxo(mensagem2)
end

# inicio3
Quando("visualizar o menu {string} seleciono a opção {string}") do |menu1, opcao1|
    Fluxo.new.validacao_fluxo(menu1)
    Comum.new.selecionar_opcao(opcao1)
    Comum.new.texto_existe("Certo. Preciso confirmar seu endereço.")
end

#inicio7
Quando("visualizo a mensagem {string} informo o dado {string}") do |mensagem1, dado1|
    Fluxo.new.validacao_fluxo(mensagem1)
    Comum.new.preenche_campo(MASSA[dado1]["cpf"])
    Comum.new.clica_enviar
end
  
Então("valido que fui direciona a sequencia do fluxo {string}") do |fluxo|
    Fluxo.new.texto_existe(fluxo)
end

#inicio8
Quando("informo o dado {string}") do |dado1|
    Comum.new.preenche_campo(MASSA[dado1]["cpf"])
    Comum.new.clica_enviar
  end
  
#inicio9  
Quando("informo o dado {string} visualizo a mensagem {string} a mensagem {string}") do |dado1, mensagem1, mensagem2|
    Comum.new.preenche_campo(MASSA[dado1]["cpf"])
    Comum.new.clica_enviar
    Fluxo.new.validacao_fluxo(mensagem1)
  end
   

 
   
  
