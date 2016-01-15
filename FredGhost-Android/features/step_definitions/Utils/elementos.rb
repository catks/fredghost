# encoding: utf-8
module Elementos

  module CadastroPF
    Cpf = "* id:'document'"
    Nome = "* id:'name'"
    Sobrenome= "* id:'lastname'"
    RG= "* id:'register'"
    DataDeNascimento = "* id:'birthday'"
    Sexo = "* id:'gender'"
    Telefone = "* id:'phone'"
    TelefoneCelular = "* id:'cell_phone'"

  end

  module CadastroPJ
    Cnpj = "* id:'e_register'"
    Nome = "* id:'e_name'"
    Sobrenome= "* id:'e_lastname'"
    Setor= "* id:'e_section'"
    Cargo= "* id:'e_job_name'"
    Inscicao_Estadual= "* id:'e_state_register'"
    Razao_Social= "* id:'e_enterprise'"
    Nome_Fantasia= "* id:'e_fake_name'"

  end

  module CadastroEndereco
    CEP= "* id:'postal_code'"
    Rua= "* id:'street'"
    Numero= "* id:'number'"
    Complemento= "* id:'complement'"
    Bairro= "* id:'district'"
    Cidade= "* id:'city'"
    Estado= "* id:'state'"

  end

  module CadastroDadosDeAcesso
    Email="* id:'email'"
    Senha="* id:'password'"
    ConfirmeASenha="* id:'password_retype'"
    Newsletter="* id:'newsletter'"
  end

  module Calendario
    Ano="* id:'date_picker_year'"
    Mes="* id:'date_picker_month'"
    Dia="* id:'date_picker_day'"
  end

  module Carrinho
    #Array_Quantidade = "* id:'product_quantity'"
    Array_Nome_Produto = "* id:'product_name'"
    Array_Quantidades = "* id:'text1'"
    Array_Precos = "* id:'new_price'"
    Array_Cor = "* id:'product_color'"
    Array_Tamanho = "* id:'product_size'"
    Array_Prazo_de_Entrega = "* id:'product_shipping'"

    Subtotal = "* id:'subtotal'"
    Frete = "* id:'shipping_cost'"
    Desconto = "* id:'discount'"
    Vale_Compras = "* id:'credit_ticket'"
    Total = "* id:'total'"
    Opcoes_De_Parcelamento = "* id:'financing'"


  end

  module MenuHamburger
    Email = "* id:'email'"
  end

  module MinhaConta

    Sair= "* id:'action_sign_out'"

    module MeusDados
      Nome= "* id:'name'"
      Email = "* id:'email'"
      RG = "* id:'register'"
      Cpf = "* id:'document'"
      Data_De_Nascimento = "* id:'birthday'"
      Sexo = "* id:'gender'"
      Telefone = "* id:'phone'"
      Telefone_Celular = "* id:'cell_phone'"

      #Alterar Email ou senha
      Senha_Atual = "* id:'current_password'"
    end

    module MeusEnderecos
      Nome_Endereco = "* id:'title'"
      Rua_Numero = "* id:'line1'"
      Bairro_Cep = "* id:'line2'"
      Cidade_Estado = "* id:'line3'"
      Telefone = "* id:'line4'"
      Endereco_Container = "* id:'container'"

      module Alterar
        Nome_Endereco = "* id:'address_id'"
        Recebedor = "* id:'receiver'"
        CEP = "* id:'postal_code''"
        Rua = "* id:'street'"
        Numero = "* id:'number'"
        Complemento = "* id:'complement'"
        Bairro = "* id:'district'"
        Cidade = "* id:'city'"
        Estado = "* id:'text2'"
        Telefone = "* id:'main_phone'"
        Celular = "* id:'secondary_phone'"
      end
    end

    module MeusPedidos
      Numero_Do_Pedido = "* id:'order_number'"
      Metodo_De_Pagamento = "* id:'payment'"
      Preco = "* id:'price'"
      Data="* id:'order_date'"
      Status = "* id:'status'"

    end

  end

  module Pdp
    Nome_Produto = "TextView"
    Imagem = "* id:'image'"
    Preco_De = "* id:'old_price'"
    Preco_Por = "* id:'price'"
    Tamanho = "* marked:'Tamanho'"
    Aba_Descricao = "* marked:'Descrição'"
    Descricao = "* id:'description'"
    Aba_Avaliacoes = "* marked:'Avaliações'"
    Avaliacoes_Ver_Todos = "* marked:'Ver todos'"
    module VerMaisDescricao
      Descricao_Completa = "* id:'content'"
    end
    module Tamanhos
      Disponiveis = "AppCompatTextView id:'content'"
    end
    module VerTodasAvaliacoes
      Autores = "* id:'review_creator'"
      Titulos = "* id:'rating_title'"
      Conteudo = "* id:'rating_content'"
    end
    #TODO: Cores (Ainda não há id para elas)
    module Compra
      Rapida = "* id:'quick_buy'"
      Checkout = "* id:'checkout'"
    end

  end


  module Checkout
    Boleto = "* marked:'Boleto Bancário'"
    Cartao = "* marked:'Cartão de Crédito'"
    Endereco_Alterar = "* id:'message'"

    module Endereco
      Nome_Endereco = "* id:'title'"
      Rua_Numero = "* id:'line1'"
      Bairro_Cep = "* id:'line2'"
      Cidade_Estado = "* id:'line3'"
      Telefone = "* id:'line4'"
    end
  end

end
