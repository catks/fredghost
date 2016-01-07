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
end

World(FredHelpers) #Inclui os metodos desso modulo para rodar nos testes do cucumber
