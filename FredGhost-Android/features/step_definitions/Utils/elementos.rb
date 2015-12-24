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



end
