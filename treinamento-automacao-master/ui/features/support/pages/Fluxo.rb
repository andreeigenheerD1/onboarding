class Fluxo
    include Capybara::DSL
  
    def validacao_fluxo(valida_fluxo)
        case valida_fluxo
        when "Inicio"
            Comum.new.texto_existe("Miiiaw!! Eu sou a Cordélia, assistente virtual da Miau Miau Cartões.")
        when "Menu inicial"
            Comum.new.texto_existe("Você já possui um de nossos cartões?") 
        when "Proposta"
            Comum.new.texto_existe("Que tal fazer uma proposta agora?")    
        when "Fim do chat 1"
            Comum.new.texto_existe("Nossos cartões podem ser solicitados pela internet! Clique aqui e escolha!")
        when "Fim do chat 2"
            Comum.new.texto_existe("Prrr. Desculpe, mas não consegui identificar o CPF. Me manda uma mensagem novamente mais tarde, por favor.")
        when "Cpf"
            Comum.new.texto_existe("Qual o número do CPF do titular?")  
        when "Boas vindas"
            Comum.new.texto_existe("Bem vindo Karina Gomes Costa!") 
        when "Importante"
            Comum.new.texto_existe("IMPORTANTE: Para sua segurança não forneça a senha do seu cartão para terceiros. Evite Transtornos!")
        when "Deseja falar"
            Comum.new.titulo_existe("Sobre o que você deseja falar?")
        when "Solicitacoes"
            Comum.new.texto_existe("Entendi. Para solicitar um cartão adicional você precisa: - Acessar a aba SOLICITAÇÕES; - Preencher o formulário e enviar os documentos em anexo no mesmo; - Instantes depois você receberá por email os próximos passos.")    
        when "Menu gancho"
            Comum.new.texto_existe("Você ainda precisa de ajuda?") 
        when "Inicio nao recebi meu cartao"  
            Comum.new.texto_existe("Certo. Preciso confirmar seu endereço. Por favor, informe seu CEP.")  
        when "Certo"
            Comum.new.texto_existe("Certo!")   
        when "Sobre limite"
            Comum.new.texto_existe("Para saber sobre limite, você precisa: - Acessar o APP da MiauMiau e entrar no Menu Inicial; - Clique em Limite. Ali você consegue saber sobre o seu limite atual, reajustar seu limite e solicitar um aumento")
        when "fatura"
            Comum.new.texto_existe("Miiiaw! Para saber sobre sua fatura, você pode: - Acessar o APP da MiauMiau e entrar no Menu Inicial; - Clicar na opção Fatura. Nessa aba, você consegue acessar as faturas de meses anteriores e as do próximo trimestre.")
        when"Sobre outros"
            Comum.new.texto_existe("Miiiaw! Para saber sobre outros assuntos, você pode acessar nossa FAQ, localizada na parte superior ao lado direito da página inicial.")        
        when "Nova"
            Comum.new.texto_existe("Posso solicitar uma nova tentativa de entrega do seu cartão para o endereço abaixo? [logradouro, bairro, estado]")                              
        when "Escolha"
            Comum.new.titulo_existe("Legal! Escolha o melhor dia para receber seu cartão:")
        when "Informe endereco"
            Comum.new.texto_existe("Tudo bem! Nesse caso, preciso que me ajude digitando um novo endereço.")
        when "Periodo"
            Comum.new.texto_existe("Certo! Agora qual o melhor período para entrega?")
        when "Solicitada"
            Comum.new.texto_existe("Miaaaw! Uma nova entrega já foi solicitada.")
        when "Dez dias"
            Comum.new.texto_existe("Em até 10 dias úteis o seu cartão será entregue, sendo necessário uma pessoa acima de 18 anos para recebê-lo.")
        when "Agradecimento"
            Comum.new.texto_existe("Muito obrigada pelo contato!") 
        when "Pesquisa de satisfacao"   
            Comum.new.texto_existe("Ah! Mais uma coisa... Antes de encerrar, responda nossa pesquisa, por favor.")                
        when"Atendimento"
            Comum.new.titulo_existe("Qual nota você dá para o meu atendimento?")
        when "Tentativa1"
            Comum.new.texto_existe("O CPF inserido é inválido. Podemos tentar novamente.")
        when "Tentativa2"
            Comum.new.texto_existe("Podemos tentar novamente.")    
        when "Feliz"
            Comum.new.texto_existe("Certo! Fico feliz em ter conseguido te ajudar hoje.")  
        when "Fim do chat 4"      
            Comum.new.texto_existe("A MiauMiau agradece o seu contato e quando precisar novamente é só me chamar aqui.")
        when "Tentativa_cartao"
            Comum.new.texto_existe("Podemos tentar novamente. Digite novamente o CEP, por favor.")
        when "Fim do chat recebimento"
            Comum.new.texto_existe("Prrr. Desculpe, mas não consegui identificar o CEP Me manda uma mensagem novamente mais tarde, por favor.") 
        when"Confirma"
            Comum.new.texto_existe("Certo! Está quase acabando...Você confirma o endereço abaixo? [logradouro, número, complemento, bairro, estado]")
        when "Nao inserido"
            Comum.new.texto_existe("Ops! Não consegui encontrar o CPF inserido na nossa base!")
            
        else
            raise "Erro - Fluxo inválido"
        end  
            
    end

    def redirecionamento_fluxo(fluxo)
        case fluxo
         when "Inicio"
            validacao_fluxo("Inicio")

         when "Nao recebi meu cartao" 
            validacao_fluxo("Inicio")
            validacao_fluxo("Menu inicial")
            Comum.new.clicar_pesquisa("SIM")  
            validacao_fluxo("Cpf")  
            Comum.new.preenche_campo(MASSA["cpf_cadastrado"]["cpf"])
            Comum.new.clica_enviar
            validacao_fluxo("Boas vindas")
            validacao_fluxo("Importante")
            validacao_fluxo("Deseja falar")
            Comum.new.selecionar_opcao("Não recebi meu cartão")
            validacao_fluxo("Inicio nao recebi meu cartao")

         when "Pesquisa de satisfação" 
            redirecionamento_fluxo("Fluxo menu gancho")
            Comum.new.clicar_pesquisa("NÃO")
           
         when "Fluxo menu gancho"
            validacao_fluxo("Inicio")
            validacao_fluxo("Menu inicial")
            Comum.new.clicar_pesquisa("SIM")  
            validacao_fluxo("Cpf")  
            Comum.new.preenche_campo(MASSA["cpf_cadastrado"]["cpf"])
            Comum.new.clica_enviar
            validacao_fluxo("Boas vindas")
            validacao_fluxo("Importante")
            validacao_fluxo("Deseja falar") 
            Comum.new.selecionar_opcao("Solicitar adicional")
            validacao_fluxo("Solicitacoes")
     
        
         else
            raise "Erro - Redirecionamento inválido"
        end    
    end
end

# crie metodos de validacao que façam sentido a sua automacao. 