# encoding: utf-8
module Modelos
  class Endereco
    attr_accessor :nome_endereco,:recebedor,:cep,:rua,:numero,:complemento,:bairro,:cidade,:estado,:telefone,:celular

    def initialize(nome_endereco,recebedor,cep,rua,numero,complemento,bairro,cidade,estado,telefone,celular)
      @nome_endereco = nome_endereco
      @recebedor = recebedor
      @cep = cep
      @rua = rua
      @numero = numero
      @complemento = complemento
      @bairro = bairro
      @cidade = cidade
      @estado = estado
      @telefone = telefone
      @celular = celular
    end

    def to_s()

      s =
      "
      Nome Endereço: #{@nome_endereco}
      Recebedor = #{@recebedor}
      CEP = #{@cep}
      Rua = #{@rua}
      Numero = #{@numero}
      Complemento = #{@complemento}
      Bairro = #{@bairro}
      Cidade = #{@cidade}
      Estado = #{@estado}
      Telefone = #{@telefone}
      Celular = #{@celular}
      "
      return s
    end
  end
end
