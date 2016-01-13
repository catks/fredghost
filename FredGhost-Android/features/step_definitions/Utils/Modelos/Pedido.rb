# encoding: utf-8
module Modelos
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
