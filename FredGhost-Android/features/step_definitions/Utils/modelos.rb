module Modelos

  class ItemCarrinho
    attr_accessor :nome, :quantidade , :preco , :cor , :tamanho

    def initialize(nome,quantidade,preco,cor,tamanho)
      @nome = nome
      @quantidade = quantidade
      @preco = preco
      @cor = cor
      @tamanho = tamanho
    end

  end

end
