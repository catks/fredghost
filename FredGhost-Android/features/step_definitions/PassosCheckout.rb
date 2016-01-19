# encoding: utf-8
require 'calabash-android/calabash_steps'

Dado(/^que estou na tela de checkout$/) do
  steps %{
    Dado que estou no carrinho
    E clico no botão circular de pagamento
  }
end

Então(/^seleciono a opção de entrega "(Entrega Convencional|Entrega Agendada)"$/) do |tipoEntrega|
#Então(/^selecionar a opção de entrega "([^"]*)"$/) do |tipoEntrega|
  wait_for(timeout: 10) { element_exists "* id:'radio'" }
  if tipoEntrega.downcase  == "entrega convencional"
    touch(query("* id:'radio'")[0])
  elsif tipoEntrega.downcase  == "entrega agendada"
    touch(query("* id:'radio'")[1])
  end
end

Então(/^vejo que meu endereço está sendo exibido$/) do
  wait_for_element_exists(Elementos::Checkout::Endereco::Nome_Endereco)
  @nome_endereco_padrao = (query Elementos::Checkout::Endereco::Nome_Endereco , :text).first
  expect(@nome_endereco_padrao).not_to be_empty
end

Então(/^clico no endereço "([^"]*)"$/) do |num_endereco|
  sleep 2
  endereco = (query Elementos::MinhaConta::MeusEnderecos::Nome_Endereco)[num_endereco.to_i] #Não daremos menos 1 pois o Selecione o endereço tb possui a id title
  @nome_endereco_selecionado = endereco['text']
  touch endereco
end

Então(/^vejo que o endereço mudou para meu endereço selecionado$/) do
  sleep 2
  nome_endereco =(query Elementos::Checkout::Endereco::Nome_Endereco , :text).first
  expect(nome_endereco).to eq @nome_endereco_selecionado
end

Então(/^vejo que o endereço foi adicionado$/) do
  aguardar_carregar
  endereco = (query "* id:'title'" , :text).first
  expect(endereco).to eq @novo_endereco_nome
end

Então(/^vejo que o prazo e valor de ambas as Entregas estão sendo exibidos$/) do
  prazos = (query Elementos::Checkout::Frete::Prazos_Entrega , :text)
  valores = (query Elementos::Checkout::Frete::Valor_Entrega , :text)
  prazo_entrega_convencional = prazos[0]
  prazo_entrega_agendada = prazos[1]

  valor_entrega_convencional = valores[0]
  valor_entrega_agendada = valores[1]

  puts %{
    Entrega Convencional
      Prazo: #{prazo_entrega_convencional}
      Valor: #{valor_entrega_convencional}

    Entrega Agendada
      Prazo: #{prazo_entrega_agendada}
      Valor: #{valor_entrega_agendada}
  }

  expect(prazo_entrega_convencional).not_to be_empty
  expect(valor_entrega_convencional).to be_a_price

  expect(prazo_entrega_agendada).not_to be_empty
  expect(valor_entrega_agendada).to be_a_price
end

Então(/^seleciono a forma de pagamento como "([^"]*)"$/) do |tipoPagamento|

  # TODO: Melhorar o jeito de achar a radio certa
  sleep(3)
  wait_for(timeout: 15) { element_exists "* id:'radio'" }
  if tipoPagamento.downcase.include? "boleto"
    check_element_exists("* marked:'Boleto Bancário'")
    touch(query("* id:'radio'")[2])

  elsif tipoPagamento.downcase.include? "cartão"
    if (element_does_not_exist("* marked:'Boleto Bancário'")) # Se não tiver a opção de boleto
      touch(query("* id:'radio'")[2])
    else
      touch(query("* id:'radio'")[3])
    end

  end
end

Então(/^vejo que a opção "([^"]*)" está sendo exibido$/) do |texto|
  wait_for_element_exists("* marked:'#{texto}'" , :timeout => 10 )
end

Então(/^visualizo os campos para adicionar um novo cartão$/) do
  # expect("* marked:'Titular do Cartão'").to exist_in_page
  # expect("* marked:'Número do Cartão'").to exist_in_page
  # expect("* marked:'CVC'").to exist_in_page
  # expect("* id:'card_year'").to exist_in_page
  # expect("* id:'card_month'").to exist_in_page
  sleep 2
  expect(Elementos::Checkout::NovoCartao::Titular).to exist_in_page
  expect(Elementos::Checkout::NovoCartao::Numero).to exist_in_page
  expect(Elementos::Checkout::NovoCartao::Mes).to exist_in_page
  expect(Elementos::Checkout::NovoCartao::Ano).to exist_in_page
  expect(Elementos::Checkout::NovoCartao::CVC).to exist_in_page
end

Então(/^visualizo as bandeiras dos cartões$/) do
  expect(Elementos::Checkout::NovoCartao::Bandeiras).to exist_in_page
  #bandeiras = query Elementos::Checkout::NovoCartao::Bandeiras , :id
  bandeiras = seletor(Elementos::Checkout::NovoCartao::Bandeiras).id
  bandeiras.each do |bandeira|
    puts bandeira
  end
  expect(bandeiras).to include('mastercard ')
  expect(bandeiras).to include('visa')
  expect(bandeiras).to include('diners')
  expect(bandeiras).to include('american_express')
  expect(bandeiras).to include('hipercard')

end


Mas(/^continuo na tela de adicionar cartão.*$/) do
  steps %{
    Então visualizo os campos para adicionar um novo cartão
  }
end
