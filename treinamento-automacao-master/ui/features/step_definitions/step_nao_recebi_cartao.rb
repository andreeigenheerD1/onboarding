Dado("informo o dado {string} invalido por tres vezes") do |dado|
  Comum.new.preenche_campo(MASSA[dado]["cep"])
  Comum.new.clica_enviar
  Fluxo.new.validacao_fluxo("Tentativa_cartao")
  Comum.new.preenche_campo(MASSA[dado]["cep"])
  Comum.new.clica_enviar
  Comum.new.texto_existe("Prrr. Desculpe, mas não consegui identificar o CEP. Digite apenas os números.")
  Comum.new.preenche_campo(MASSA[dado]["cep"])
  Comum.new.clica_enviar
end

Dado("informo o dado {string} seleciono a opcao {string} seleciono a opcao {string} seleciono a opcao {string}") do |dado, opcao1, opcao2, opcao3|
  Comum.new.preenche_campo(MASSA[dado]["cep"])
  Comum.new.clica_enviar
  Comum.new.clicar_pesquisa(opcao1)
  Comum.new.selecionar_opcao(opcao2)
  Comum.new.selecionar_opcao(opcao3)
end

Dado("informo o dado {string} seleciono a opcao {string} seleciono a opcao {string}") do |dado, opcao1, opcao2|
  Comum.new.preenche_campo(MASSA[dado]["cep"])
  Comum.new.clica_enviar
  Comum.new.clicar_pesquisa("SIM")
  Comum.new.selecionar_opcao("Sábado")
end

Dado("informo o dado {string} seleciono a opcao {string} informo o dado {string} seleciono a opcao {string} informo o dado {string}") do |dado1, opcao1, dado2, opcao2, dado3|
  Comum.new.preenche_campo(MASSA[dado1]["cep"])
  Comum.new.clica_enviar
  Comum.new.clicar_pesquisa(opcao1)
  Comum.new.preenche_campo(MASSA[dado2]["numero"])
  Comum.new.clica_enviar
  Comum.new.clicar_pesquisa(opcao2)
  Comum.new.preenche_campo(MASSA[dado3]["complemento"])
  Comum.new.clica_enviar
end

Dado("informo o dado {string} seleciono a opcao {string}") do |dado1, opcao1|
  Comum.new.preenche_campo(MASSA[dado1]["cep"])
  Comum.new.clica_enviar
  Comum.new.clicar_pesquisa("NÃO")
end

Dado("seleciono a opcao {string}") do |opcao1|
  Comum.new.clicar_pesquisa(opcao1)
end

Então("valido que visualizei o titulo {string}") do |titulo1|
    Comum.new.titulo_existe(titulo1)
end

                                                                                                       

