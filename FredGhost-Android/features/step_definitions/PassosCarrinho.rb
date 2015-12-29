# encoding: utf-8
require 'calabash-android/calabash_steps'
require 'minitest/autorun'

Dado(/^que estou no carrinho$/) do
  sleep 3
  #assert_equal("Carrinho",query("TextView index:0",:text).first)
  expect(query("TextView index:0",:text).first).to  eq "Carrinho"

end

Então(/^posso visualizar os itens no carrinho$/) do
  @produtos_carrinho = []

  qtd_de_produtos = query(Elementos::Carrinho::Array_Quantidades).length

  for i in 0 ..qtd_de_produtos-1

    #Quantidade
    produto_quantidade = (query Elementos::Carrinho::Array_Quantidades, :text)[i]
    produto_quantidade.slice! "Quantidade: " #Cortamos a string para obtermos apenas o número
    produto_quantidade = produto_quantidade.to_i # Convertemos de string para inteiro

    #Preco
    produto_preco = (query Elementos::Carrinho::Array_Precos, :text)[i]
    # produto_preco.slice! "R$ " #Cortamos a string para obtermos apenas o número
    # produto_preco.to_f # Convertemos de string para decimal

    #nome

    produto_nome = (query Elementos::Carrinho::Array_Nome_Produto, :text)[i]

    #Para cada produto no carrinho vamos criar um novo objeto
    @produtos_carrinho << Modelos::ItemCarrinho.new(produto_nome,produto_quantidade,produto_preco)


  end
end

Quando(/^clico na quantidade do item "([^"]*)"$/) do |num_item|
  indice = num_item.to_i - 1
  touch (query Elementos::Carrinho::Array_Quantidades)[indice]
end

Então(/^a quantidade e o preço do item "([^"]*)" deverá ter mudado$/) do |num_item|
  sleep 2
  indice = num_item.to_i - 1
  preco = (query Elementos::Carrinho::Array_Precos, :text)[indice]
  expect(preco).not_to  eq @produtos_carrinho[indice]
  puts "Valor Obtido: #{preco} Valor antes de alterar a quantidade: #{@produtos_carrinho[indice].preco}"
end

Dado(/^que tenho mais de "([^"]*)" item no carrinho$/) do |qtd_itens|
  expect(@produtos_carrinho.length).to be > qtd_itens.to_i
  puts "Quantidade de itens no carrinho: #{@produtos_carrinho.length}"
end

Então(/^posso visualizar os dados dos itens$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
