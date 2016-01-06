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

  class PessoaFisica
    attr_accessor :nome , :email , :rg , :cpf , :data_nascimento , :sexo , :telefone , :celular
    def initialize(nome,email,rg,cpf,data_nascimento,sexo,telefone=nil,celular=nil)
      @nome = nome
      @email = email
      @rg = rg
      @cpf = cpf
      @data_nascimento = data_nascimento
      @sexo = sexo
      @telefone = telefone
      @celular = celular
    end

    def to_s()

      s =
      "
      Nome: #{@nome}
      Email: #{@email}
      R.G: #{@rg}
      CPF: #{@cpf}
      Data Nascimento: #{@data_nascimento}
      Sexo: #{@sexo}
      Telefone: #{@telefone}
      Celular: #{@celular}
      "
      return s
    end
  end


end
