# encoding: utf-8
require 'calabash-android/calabash_steps'

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
