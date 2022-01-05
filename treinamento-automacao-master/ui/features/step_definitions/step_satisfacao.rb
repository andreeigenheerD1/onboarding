Dado("visualizo a mensagem {string} seleciono a opcao {string} visualizo a mensagem {string} preencho o campo {string}") do |mensagem1, opcao, mensagem2, campo|
   Fluxo.new.validacao_fluxo(mensagem1)    
   Comum.new.selecionar_opcao(opcao)
   Comum.new.texto_existe(mensagem2)
   Comum.new.preenche_campo(campo)
   Comum.new.clica_enviar
 end

