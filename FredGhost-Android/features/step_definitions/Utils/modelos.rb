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

  class Pedido
    attr_accessor :id_pedido,:forma_pagamento,:valor_total,:data,:status

    def initialize(id_pedido,forma_pagamento,valor_total,data,status)
      @id_pedido = id_pedido
      @forma_pagamento = forma_pagamento
      @valor_total = valor_total
      @data = data
      @status = status
    end

    def to_s()

      s =
      "
      Pedido: #{@id_pedido}
      Forma Pagamento: #{@forma_pagamento}
      Valor: #{@valor_total}
      Data: #{@data}
      Status: #{@status}
      "
      return s
    end

  end

end
