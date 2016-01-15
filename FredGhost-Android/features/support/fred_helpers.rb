# encoding: utf-8
module FredHelpers
  def clicar_em(elemento)
    steps %{
    Então clico em "#{elemento}"
    }
  end

  def deslizar_para_baixo_ate(elemento)
    steps %{
    Então deslizo para baixo até que eu veja o "#{elemento}"
    }
  end

  #Desliza até o elemento desejado
    #elemento -> Recebe a query para achar o elemento ex: "* id:'city'"
    #direcao -> armazena um Symbol deve receber :down ou :up
    #view -> view que o android deve dar o scroll, caso seja omitido ele usa a view "* id:'recycler_view'"
    #max_tentativas -> numero maximo de scrolls que serao dados para achar o elemento
  def deslizar_ate(elemento, direcao, view = "* id:'recycler_view'", max_tentativas = 30)
    scrolls = 0
      while (q.empty? && scrolls < max_tentativas)
        scroll(view, direcao.to_sym)
        q = query(elemento)
        scrolls = scrolls + 1
      end

      if scrolls >= max_tentativas
        raise "Não foi possível deslizar até o Elemento, o elemento '#{elemento}' não foi encontrado (Número máximo de scrolls atingido)"
      end
  end

  def esperar(segundos)
    sleep(segundos.to_i)
  end

  def carregarArrayDeItensCarrinho()
    query "*"
    steps %{
    E posso visualizar os itens no carrinho
    }

  end
  def esperar_teclado_sumir()
    sleep 2 #TODO : melhorar
  end
  def esconder_teclado()
    hide_soft_keyboard #Retira o teclado da tela se estiver visivel
    esperar_teclado_sumir
  end

  def aguardar_carregar(timeout=10)
    wait_for_element_does_not_exist("ProgressBar", :timeout => timeout)
  end


end

World(FredHelpers) #Inclui os metodos desso modulo para rodar nos testes do cucumber
