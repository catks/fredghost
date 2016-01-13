# encoding: utf-8
require 'calabash-android/calabash_steps'

Então(/^devo ver que estou logado$/) do
  email = (query Elementos::MinhaConta::MeusDados::Email, :text).first
  expect(email).to eq @email
end

Então(/^posso visualizar que meu nome é "([^"]*)"$/) do |nome_esperado|
  sleep 2
  nome = (query Elementos::MinhaConta::MeusDados::Nome, :text)[1]
  expect(nome).to eq nome_esperado
end

Então(/^que meu email é "([^"]*)"$/) do |email_esperado|
  email = (query Elementos::MinhaConta::MeusDados::Email, :text).first
  expect(email).to eq email_esperado
end

Então(/^que meu RG é "([^"]*)"$/) do |rg_esperado|
  rg = (query Elementos::MinhaConta::MeusDados::RG, :text).first
  expect(rg).to eq rg_esperado
end

Então(/^que meu CPF é "([^"]*)"$/) do |cpf_esperado|
  cpf = (query Elementos::MinhaConta::MeusDados::Cpf, :text).first
  expect(cpf).to eq cpf_esperado
end

Então(/^que minha Data de Nascimento é "([^"]*)"$/) do |data_nascimento_esperada|
  data_nascimento = (query Elementos::MinhaConta::MeusDados::Data_De_Nascimento, :text).first
  expect(data_nascimento).to eq data_nascimento_esperada
end

Então(/^que meu Sexo é "([^"]*)"$/) do |sexo_esperado|
  sexo = (query Elementos::MinhaConta::MeusDados::Sexo, :text).first
  expect(sexo).to eq sexo_esperado
end

Então(/^que meu Telefone é "([^"]*)"$/) do |telefone_esperado|
  telefone = (query Elementos::MinhaConta::MeusDados::Telefone, :text).first
  expect(telefone).to eq telefone_esperado
end

Então(/^que meu Telefone Celular é "([^"]*)"$/) do |celular_esperado|
  celular = (query Elementos::MinhaConta::MeusDados::Telefone_Celular, :text).first
  expect(celular).to eq celular_esperado
end

Então(/^devo deslizar até a aba "([^"]*)"$/) do |nome_aba|

  while (element_does_not_exist "* marked:'#{nome_aba}'")
    pan "LinearLayout" , :left
    sleep 1
  end

  tap_mark nome_aba

end

Então(/^visualizo meus dados$/) do
  nome = (query Elementos::MinhaConta::MeusDados::Nome, :text)[1]
  email = (query Elementos::MinhaConta::MeusDados::Email, :text).first
  rg = (query Elementos::MinhaConta::MeusDados::RG, :text).first
  cpf = (query Elementos::MinhaConta::MeusDados::Cpf, :text).first
  data_nascimento = (query Elementos::MinhaConta::MeusDados::Data_De_Nascimento, :text).first
  sexo = (query Elementos::MinhaConta::MeusDados::Sexo, :text).first
  telefone = (query Elementos::MinhaConta::MeusDados::Telefone, :text).first
  celular = (query Elementos::MinhaConta::MeusDados::Telefone_Celular, :text).first
  #Cria uma variavel de instancia com os dados do cliente
  @pessoa = Modelos::PessoaFisica.new(nome,email,rg,cpf,data_nascimento,sexo,telefone,celular)
  puts @pessoa.to_s

end

Então(/^visualizo meus dados alterados$/) do
  #Vamos salvar os dados antigos
  @pessoa_antiga = @pessoa
  #Vamos carregar os novos dados do perfil com o step de visualização
  steps %{
    Então visualizo meus dados
  }

  # nome = (query Elementos::MinhaConta::MeusDados::Nome, :text)[1]
  # email = (query Elementos::MinhaConta::MeusDados::Email, :text).first
  # rg = (query Elementos::MinhaConta::MeusDados::RG, :text).first
  # cpf = (query Elementos::MinhaConta::MeusDados::Cpf, :text).first
  # data_nascimento = (query Elementos::MinhaConta::MeusDados::Data_De_Nascimento, :text).first
  # sexo = (query Elementos::MinhaConta::MeusDados::Sexo, :text).first
  # telefone = (query Elementos::MinhaConta::MeusDados::Telefone, :text).first
  # celular = (query Elementos::MinhaConta::MeusDados::Telefone_Celular, :text).first

  #Vamos verificar se os dados são diferentes
  expect(@pessoa.nome).not_to eq @pessoa_antiga.nome
  #expect(@pessoa.email).not_to eq @pessoa_antiga.email
  expect(@pessoa.rg).not_to eq @pessoa_antiga.rg
  #expect(@pessoa.cpf).not_to eq @pessoa_antiga.cpf
  #expect(@pessoa.data_nascimento).not_to eq @pessoa_antiga.data_nascimento
  expect(@pessoa.sexo).not_to eq @pessoa_antiga.sexo
  expect(@pessoa.telefone).not_to eq @pessoa_antiga.telefone
  expect(@pessoa.celular).not_to eq @pessoa_antiga.celular

end

Então(/^clico em sair$/) do
  touch Elementos::MinhaConta::Sair
  tap_mark "Sim"
end

Então(/^coloco minha senha atual "([^"]*)"$/) do |senha|
  touch Elementos::MinhaConta::MeusDados::Senha_Atual
  keyboard_enter_text(senha)
  hide_soft_keyboard #Retira o teclado da tela se estiver visivel
  esperar_teclado_sumir
end

Então(/^mudo a minha senha para "([^"]*)" novamente$/) do |nova_senha|
steps %{
  E clico em "Minha conta"
  E espero carregar
  E clico em "Alterar e-mail e/ou senha"
  E preencho o campo "Nova senha" com "#{nova_senha}"
  E preencho o campo "Repita a nova senha" com "#{nova_senha}"
  Então coloco minha senha atual "#{@senha}"
  E clico em "OK"
  Então espero carregar
  E não devo ver uma mensagem de erro
}
end

Então(/^mudo o meu email para "([^"]*)"$/) do |email|
steps %{
  E clico em "Minha conta"
  E espero carregar
  E clico em "Alterar e-mail e/ou senha"
  E preencho o campo "Novo e-mail" com "#{email}"
  Então coloco minha senha atual "#{@senha}"
  E clico em "OK"
  Então espero carregar
  E não devo ver uma mensagem de erro
}
end

Então(/^visualizo meus endereços$/) do

  @qtd_enderecos = (query Elementos::MinhaConta::MeusEnderecos::Endereco_Container).size
  for i in (0...@qtd_enderecos) # 0 <
    nome_endereco = (query Elementos::MinhaConta::MeusEnderecos::Nome_Endereco , :text)[i]
    rua_numero = (query Elementos::MinhaConta::MeusEnderecos::Rua_Numero , :text)[i]
    bairro_cep = (query Elementos::MinhaConta::MeusEnderecos::Bairro_Cep , :text)[i]
    cidade_estado = (query Elementos::MinhaConta::MeusEnderecos::Cidade_Estado , :text)[i]
    telefone = (query Elementos::MinhaConta::MeusEnderecos::Telefone , :text)[i]
    puts %{
      Endereço #{i+1}:
      #{nome_endereco}
      #{rua_numero}
      #{bairro_cep}
      #{cidade_estado}
      #{telefone}
    }
    expect(nome_endereco).not_to be_empty
    expect(rua_numero).not_to be_empty
    expect(bairro_cep).not_to be_empty
    expect(cidade_estado).not_to be_empty
    expect(telefone).not_to be_empty
  end
end

Então(/^visualizo meus pedidos$/) do
  wait_for_element_exists(Elementos::MinhaConta::MeusPedidos::Preco , :timeout => 10)
  qtd_pedidos = (query Elementos::MinhaConta::MeusPedidos::Preco).size
  @pedidos = []
  for i in (0...qtd_pedidos)
    num_pedido = (query Elementos::MinhaConta::MeusPedidos::Numero_Do_Pedido , :text)[i]
    num_pedido.slice! "Pedido Nº: "
    forma_pagamento = (query Elementos::MinhaConta::MeusPedidos::Metodo_De_Pagamento , :text)[i]
    valor = (query Elementos::MinhaConta::MeusPedidos::Preco , :text)[i]
    data = (query Elementos::MinhaConta::MeusPedidos::Data , :text)[i]
    status = (query Elementos::MinhaConta::MeusPedidos::Status , :text)[i]

    pedido = Modelos::Pedido.new(num_pedido,forma_pagamento,valor,data,status)
    @pedidos << pedido
  end
  @pedidos.each do |pedido|
    puts pedido.to_s #Exibe o valor do pedido
    expect(pedido.id_pedido).not_to be_empty
    expect(pedido.forma_pagamento).not_to be_empty
    expect(pedido.valor_total).not_to be_empty
    expect(pedido.data).not_to be_empty
    expect(pedido.status).not_to be_empty
  end
end

Então(/^clico no endereço "([^"]*)"$/) do |num_endereco|
  endereco = (query Elementos::MinhaConta::MeusEnderecos::Nome_Endereco)[num_endereco.to_i-1]
  touch endereco
end

Então(/^visualizo os dados do meu endereço$/) do
  nome_endereco = (query Elementos::MinhaConta::MeusEnderecos::Alterar::Nome_Endereco , :text).first
  recebedor = (query Elementos::MinhaConta::MeusEnderecos::Alterar::Recebedor , :text).first
  cep = (query Elementos::MinhaConta::MeusEnderecos::Alterar::CEP , :text).first
  rua = (query Elementos::MinhaConta::MeusEnderecos::Alterar::Rua , :text).first
  numero = (query Elementos::MinhaConta::MeusEnderecos::Alterar::Numero , :text).first
  complemento = (query Elementos::MinhaConta::MeusEnderecos::Alterar::Complemento , :text).first
  bairro = (query Elementos::MinhaConta::MeusEnderecos::Alterar::Bairro , :text).first
  cidade = (query Elementos::MinhaConta::MeusEnderecos::Alterar::Cidade , :text).first
  estado = (query Elementos::MinhaConta::MeusEnderecos::Alterar::Estado , :text).first
  telefone = (query Elementos::MinhaConta::MeusEnderecos::Alterar::Telefone , :text).first
  scroll_down
  celular = (query Elementos::MinhaConta::MeusEnderecos::Alterar::Celular , :text).first
  scroll_up

  @endereco = Modelos::Endereco.new(nome_endereco,recebedor,cep,rua,numero,complemento,bairro,cidade,estado,telefone,celular)
  puts @endereco.to_s # exibe os dados do endereco

  #Vamos validar os dados (celular não e obrigatorio por isso não é validado)
  expect(@endereco.nome_endereco).not_to be_empty
  expect(@endereco.recebedor).not_to be_empty
  expect(@endereco.cep).not_to be_empty
  expect(@endereco.rua).not_to be_empty
  expect(@endereco.numero).not_to be_empty
  expect(@endereco.bairro).not_to be_empty
  expect(@endereco.cidade).not_to be_empty
  expect(@endereco.estado).not_to be_empty
  expect(@endereco.telefone).not_to be_empty

end

Então(/^visualizo que meu endereço foi alterado$/) do
  nome_endereco = query Elementos::MinhaConta::MeusEnderecos::Alterar::Nome_Endereco , :text
  recebedor = query Elementos::MinhaConta::MeusEnderecos::Alterar::Recebedor , :text
  cep = query Elementos::MinhaConta::MeusEnderecos::Alterar::CEP , :text
  rua = query Elementos::MinhaConta::MeusEnderecos::Alterar::Rua , :text
  numero = query Elementos::MinhaConta::MeusEnderecos::Alterar::Numero , :text
  complemento = query Elementos::MinhaConta::MeusEnderecos::Alterar::Complemento , :text
  bairro = query Elementos::MinhaConta::MeusEnderecos::Alterar::Bairro , :text
  cidade = query Elementos::MinhaConta::MeusEnderecos::Alterar::Cidade , :text
  estado = query Elementos::MinhaConta::MeusEnderecos::Alterar::Estado , :text
  telefone = query Elementos::MinhaConta::MeusEnderecos::Alterar::Telefone , :text
  scroll_down
  celular = query Elementos::MinhaConta::MeusEnderecos::Alterar::Celular , :text
  scroll_up

  #Vamos verificar se os dados são diferentes
  expect(cep).not_to eq @endereco.cep
  expect(rua).not_to eq @endereco.rua
  expect(numero).not_to eq @endereco.numero
  expect(bairro).not_to eq @endereco.bairro

end

Então(/^altero para os dados antigos$/) do
  puts @endereco.cep
  steps %{
    Então edito o campo "CEP" com "#{@endereco.cep}"
    E espero carregar
    E clico em "Atualizar"
  }
  #esperamos ter saído da tela de edição
  expect((query "* marked:'Atualizar'")).to be_empty
end

Então(/^preencho o campo Nome do Endereço com um numero aleatorio$/) do
  @novo_endereco_nome = "Teste #{rand(1000)}"
  steps %{
    Então preencho o campo "Nome do Endereço" com "#{@novo_endereco_nome}"
  }
end

Então(/^vejo que o novo endereço foi adicionado$/) do
  deslizar_ate("* marked:#{novo_endereco_nome}", :down)
end
