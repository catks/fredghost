# encoding: utf-8
require 'calabash-android/calabash_steps'

module Modelos


  class ItemCarrinho
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
