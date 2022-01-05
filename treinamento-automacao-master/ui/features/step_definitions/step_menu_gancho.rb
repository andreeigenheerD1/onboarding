 Então("seleciono a opção {string} valido que visualizo {string}") do |opcao, fluxo|
   Comum.new.clicar_pesquisa(opcao)
   Fluxo.new.validacao_fluxo(fluxo)
end
  

