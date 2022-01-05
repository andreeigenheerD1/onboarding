class Comum
  include Capybara::DSL

 ############################# WEB ################################

  def opcao_existe(opcao)
    assert_selector(EL['label_option'], visible: true)
    qnt_opcoes = all(EL['label_option']).length
    cont = 0
    while cont < qnt_opcoes
      text = all(EL['label_option'], visible: true)[cont].text
      if text.include?(opcao)
        contem_texto = true
        break
      else
        cont +=1
      end
    end
    if contem_texto == true
    else
      raise "A opcao '#{opcao}' não está sendo apresentada"
    end
  end

  def texto_existe(texto)
    assert_selector(EL['txt_whats'], visible: true, text: texto)
    # if  == true
    #   #p "O texto '#{texto}' é compatível com o que esta sendo apresentado no bot"
    # else
    #   raise "O texto '#{texto}' não é compativel com o que esta sendo apresentado no bot"
    # end
  end

  def texto_existe_exato(texto)
    if assert_selector(EL['txt_whats'], visible: true, text: texto, exact_text: true) == true
      #p "O texto '#{texto}' é compatível com o que esta sendo apresentado no bot"
    else
      raise "O texto '#{texto}' não é compativel com o que esta sendo apresentado no bot"
    end
    #Compara o que tem dentro do elemento com o que tem dentro da nossa string que colocamos no step e verifica se é EXATAMENTE igual, se não for ira dar erro
  end

  def titulo_existe(texto)
    if assert_selector(EL['title_text'], visible: true, text: texto) == true
      #p "O titulo '#{texto}' é compatível com o que esta sendo apresentado no bot"
    else
      raise "O título '#{texto}' não é compativel com o que esta sendo apresentado no bot"
    end
  end

  def titulo_existe_exato(texto)
    if assert_selector(EL['title_text'], visible: true, text: texto, exact_text: true) == true
      p "O titulo '#{texto}' é compatível com o que esta sendo apresentado no bot"
      #aqui você pode colocar uma mensagem que te irá aparecer quando sua string for igual a frase que esta dentro do elemento
    else
      raise "O título '#{texto}' não é compativel com o que esta sendo apresentado no bot"
    end
    #Compara o que tem dentro do elemento com o que tem dentro da nossa string que colocamos no step e verifica se é EXATAMENTE igual, se não for ira dar erro
  end
  #Verifica se o botao pesquisa usado em lista de opções inline esta sendo apresentado no bot e seleciona
  def selecionar_opcao(opcao)          
    opcao_existe(opcao)
    find(EL['label_option'], text: opcao).click
  end

  def selecionar_opcao_exato(opcao)
    opcao_existe(opcao)
    find(EL['label_option'], text: opcao, exact_text: true).click
  end
  # Verifica se a caixa de texto está sendo apresentada e preenche
  def preenche_campo(texto)
    assert_selector(EL['box_text'], visible: true) 
    all(EL['box_text'])[0].set(texto)
  end

  def clica_enviar
    all(EL['btn_enviar'])[0].click
  end
  #Verifica se o botao pesquisa usado em Quick Replies esta sendo apresentado no bot e seleciona.
  def clicar_pesquisa(opcao)         
    assert_selector(EL['btn_pesquisa'], visible: true, text: opcao) 
    find(EL['btn_pesquisa'], text: opcao).click
  end

  def primeira_opcao
    all(EL['label_option'])[0].click # Seleciona a primeira opcao apresentada
  end

  def screenshot(nome)
    sleep(1)
    nome.gsub! "/", "_"
    save_screenshot("data/reports/screenshots/evidencias/#{nome}}.png")
    # Realiza a captura de tela, salvando-a com o texto armazenado na variável 'nome'. Crie a pasta no caminho determinado antes de rodar.
  end

  def contem_texto(texto)
    sleep(10)
    qtd = ((all(EL['txt_whats']).length) -1)
    text = all(EL['txt_whats'])[qtd].text
      if text.include?(texto)
      else
        raise "texto nao esta sendo apresentado"
      end
  end
    # Gera massa de teste fake no formato solicitado
  def gera_info
    nome =  Faker::Name.name
    nome = nome.tr('ÂÁÉÍÓÚàáäâãèéëẽêìíïîĩòóöôõùúüûũñç', 'AAEIOUaaaaaeeeeeiiiiiooooouuuuunc')
    nome.gsub! '.','abcd'
    cpf = Faker::IDNumber.brazilian_citizen_number(formatted: true)
    email = Faker::Internet.email
    Faker::Config.locale = 'pt-BR'
    celular = Faker::PhoneNumber.cell_phone
    # cep = Faker::Address.zip_code(state_abbreviation = 'Br')
    cep = '01301-000'
    return nome, email, cpf, celular, cep
  end

  def foco_browser                # Alterna janela do navegador                 
    result = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.window(result)
  end

 ################################ FILMAGEM EVIDENCIAS ################################
  def screen_recorder (cenario)
    advanced = {
    input:    {
        framerate:  30,
        video_size: '1366x768' #Coloque a resolução recomendada para seu pc. Linux: Configurações -> Monitores -> Resolução. Windows:Na área de trabalho clique com o botão direito e escolha 'Configurações de exibição'. Em “Configurações”, escolhendo a opção “Tela”, localize o link para “Configurações de vídeo avançadas” e clique sobre ele. Agora, basta em ir “Resolução”.
    },
    output:   {
        r:       15, # Framerate
    },
    log:      'recorder.log',
    loglevel: 'level+debug', # For FFmpeg
    }
    ScreenRecorder::Desktop.new(output: "data/video/#{cenario}.mp4", advanced: advanced)
  end
 # Método inserido no "Dado" após o login
  def iniciando_filmagem
    nome = ("#{$tag}-#{$scn}").gsub(/\s+/, "") #Utiliza o nome da tag e a descrição do cenario para nomear o arquivo de vídeo
    nome = nome.gsub(",Exemplos(#", "_")
    nome = nome.gsub(",Exemplos(#", "_")
    nome = nome.gsub(")", "")
    @@recorder = Comum.new.screen_recorder(nome)
    @@recorder.start
  end
 # Método inserido no "Então"
  def encerrando_filmagem
    sleep(2)
    @@recorder.stop
  end

 ################################ LOGIN ################################

 # Abre o navegador e acessa a URL que está em data.yml em 'site_bot' 
  def login_web
    visit(DATA[$ambiente]['site_bot'])
    sleep(2)
  end

  def acessando_altu(login, senha)
    assert_selector(EL['login_altu'], visible: true)
    all(EL['login_altu'])[0].set(login)
    #acima estamos preenchendo o campo e-mail de Login do altu com nosso e-mail que deve ser colocado no arquivo credenciais.yml
    assert_selector(EL['senha_altu'], visible: true)
    all(EL['senha_altu'])[0].set(senha)
    #acima estamos preenchendo o campo senha de Login do altu com nossa senha que deve ser colocada no arquivo credenciais.yml
    all(EL['botao_enviar_altu'])[0].click 
  end
 # Para acessar no modo whatsapp pelo ALTU. Primeiro é inserido o link do builder e depois do debugger presente no Devtools do navegador
  def login_altu
    visit(DATA[$ambiente]['site_bot_altu'])
    acessando_altu(CRED['login'], CRED['senha'])
    page.driver.open_new_window
    foco_browser
    sleep(3)
    visit(DATA[$ambiente]['site_bot_whats'])
    sleep(2)
  end
 # Para acessar o Messenger, não pertence ao ALTU
  def login_facebook
    visit(DATA[$ambiente]['site_bot_facebook'])
    assert_selector(EL['login_facebook'], visible: true)
    all(EL['login_facebook'])[0].set(CRED['login'])
    #acima estamos preenchendo o campo e-mail. O e-mail que deve ser colocado no arquivo credenciais.yml
    assert_selector(EL['senha_facebook'], visible: true)
    all(EL['senha_facebook'])[0].set(CRED['senha'])
    #acima estamos preenchendo o campo senha. A senha que deve ser colocado no arquivo credenciais.yml
    all(EL['botao_entrar_facebook'])[0].click #botão que clica para entrar com o login
  end

  
end
