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

    #Cor
    produto_cor = (query Elementos::Carrinho::Array_Cor, :text)[i]

    #Tamanho
    produto_tamanho = (query Elementos::Carrinho::Array_Tamanho, :text)[i]
    produto_tamanho.slice! "Tamanho: " #Cortamos a string para obtermos apenas o número

    #Para cada produto no carrinho vamos criar um novo objeto
    @produtos_carrinho << Modelos::ItemCarrinho.new(produto_nome,produto_quantidade,produto_preco,produto_cor,produto_tamanho)


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

  puts "Itens Carrinho"
  @produtos_carrinho.each do |produto|
    expect(produto.nome).not_to be_empty
    expect(produto.quantidade).to be >= 1

    preco = produto.preco
    preco.slice! "R$ " #Cortamos a string para obtermos apenas o número
    expect(preco).not_to be_empty

    expect(produto.tamanho).not_to be_empty
    expect(produto.cor).not_to be_empty

    puts "------------------------------"
    puts "Nome do produto: #{produto.nome}"
    puts "Quantidade: #{produto.quantidade}"
    puts "Cor: #{produto.cor}"
    puts "Tamanho: #{produto.tamanho}"
    puts "Preço: #{produto.preco}"
  end

  puts "------------------------------"

end

Dado(/^saio do carrinho$/) do
  touch "ImageButton index:0"
end

Dado(/^volto ao carrinho$/) do
  touch "* id:'action_cart'"
end

Então(/^devo visualizar os mesmos itens de antes$/) do

  sleep 2
  #Validar se temos a mesma quantidade de itens
  qtd_de_produtos = query(Elementos::Carrinho::Array_Quantidades).length
  expect(qtd_de_produtos).to eq(@produtos_carrinho.size)

  #Validadar os dados de cada produto e ver se bate com o visualizado anteriormente
  index = 0
  @produtos_carrinho.each do |produto|

    #nome
    produto_nome = (query Elementos::Carrinho::Array_Nome_Produto, :text)[index]
    expect(produto.nome).to eq produto_nome

    #quantidade
    produto_quantidade = (query Elementos::Carrinho::Array_Quantidades, :text)[index]
    produto_quantidade.slice! "Quantidade: " #Cortamos a string para obtermos apenas o número
    produto_quantidade = produto_quantidade.to_i # Convertemos de string para inteiro
    expect(produto.quantidade).to eq produto_quantidade

    #preco
    produto_preco = (query Elementos::Carrinho::Array_Precos, :text)[index]
    expect(produto.preco).to eq produto_preco

    #tamanho
    produto_tamanho = (query Elementos::Carrinho::Array_Tamanho, :text)[index]
    produto_tamanho.slice! "Tamanho: " #Cortamos a string para obtermos apenas o número
    expect(produto.tamanho).to eq produto_tamanho

    #cor
    produto_cor = (query Elementos::Carrinho::Array_Cor, :text)[index]
    expect(produto.cor).to eq produto_cor

    index = index + 1
    end
  end

  Então(/^espero carregar$/) do
    wait_for_element_does_not_exist("ProgressBar", :timeout => 5)
  end

  Então(/^posso visualizar visualizar o frete$/) do
    frete = (query Elementos::Carrinho::Frete, :text)[0]
    frete.slice! "R$ " #Cortamos a string para obtermos apenas o número
    puts "Valor Frete: " + frete
    expect(frete).not_to be_empty
  end

  Então(/^deslizo até o fim do carrinho$/) do
    q = query("* marked:'Total:'")
    scrolls = 0
      while (q.empty? && scrolls < 10)
        scroll("* id:'recycler_view'", :down)
        q = query("* marked:'Total:'")
        scrolls = scrolls + 1
      end
  end
