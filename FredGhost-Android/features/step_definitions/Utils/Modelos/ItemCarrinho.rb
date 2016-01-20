# encoding: utf-8
module Modelos
  class ItemCarrinho #TODO: Refatorar o nome da classe para ItemProduto
    attr_accessor :nome, :quantidade , :preco , :cor , :tamanho , :prazo_de_entrega

    def initialize(nome,quantidade,preco,cor,tamanho,prazo = nil)
      @nome = nome
      @quantidade = quantidade
      @preco = preco
      @cor = cor
      @tamanho = tamanho
      @prazo_de_entrega = prazo
    end

  end
end
