module Modelos

  class ItemCarrinho
     attr_accessor :nome, :quantidade , :preco

    def initialize(nome,quantidade,preco)
      @nome = nome
      @quantidade = quantidade
      @preco = preco
    end

  end

end
