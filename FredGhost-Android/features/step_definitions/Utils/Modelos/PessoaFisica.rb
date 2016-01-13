# encoding: utf-8
module Modelos
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
