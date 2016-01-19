# encoding: utf-8
module FredSeletor
  #retorna um ou mais elementos encontrados pela query
  def seletor(uiquery)
    return FredSeletor::Seletor.new(uiquery)
  end

  def mquery(uiquery , symbol)
    query uiquery , symbol.to_sym
  end

  class Seletor

    attr_accessor :uiquery

    def initialize(uiquery)
      @uiquery = uiquery
    end

    def id #Retorna o id do elemento
      return FredSeletor.mquery @uiquery , :id
    end
    def text #Retorna o texto do elemento
      return FredSeletor.mquery @uiquery , :text
    end
    def tag #Retorna o valor da tag do elemento
      return FredSeletor.mquery @uiquery , :tag
    end

    def to_a #Retorna um array com oes elementos e suas respectivas propriedades
      return FredSeletor.mquery @uiquery
    end
  end


end

World(FredSeletor) #Inclui os metodos desso modulo para rodar nos testes do cucumber
