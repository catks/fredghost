# encoding: utf-8
require 'calabash-android/calabash_steps'

Dado(/^que estou no carrinho$/) do
  sleep 3
  #assert_equal("Carrinho",query("TextView index:0",:text).first)
  pagina = query("TextView index:0",:text).first
  if(pagina != "Carrinho")
    touch "* id:'menu_notification'"
    sleep 2 #Espera abrir a página do carrinho
  end

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

    #Prazo de Entrega
    prazo_entrega = (query Elementos::Carrinho::Array_Prazo_de_Entrega, :text)[i]


    #Para cada produto no carrinho vamos criar um novo objeto
    @produtos_carrinho << Modelos::ItemCarrinho.new(produto_nome,produto_quantidade,produto_preco,produto_cor,produto_tamanho,prazo_entrega)


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
  expect(preco).not_to  eq @produtos_carrinho[indice].preco
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

  Então(/^posso visualizar o frete$/) do
    frete = (query Elementos::Carrinho::Frete, :text)[0]
    frete.slice! "R$ " #Cortamos a string para obtermos apenas o número
    frete = frete.to_f
    puts "Valor Frete: " + frete.to_s
    expect(frete).not_to eq(0.0)
  end

  Então(/^visualizo o prazo de cada item do carrinho$/) do
    carregarArrayDeItensCarrinho
    expect(@produtos_carrinho).not_to be_empty #Espera que o array de itens do carrinho tenha
    puts "Prazos:"
    @produtos_carrinho.each do |item|
      puts item.prazo_de_entrega
      expect(item.prazo_de_entrega).not_to be_nil #Espera que o item tenha um prazo
    end

  end


  Então(/^posso visualizar o desconto$/) do
    desconto = (query Elementos::Carrinho::Desconto, :text)[0]
    desconto.slice! "R$ " #Cortamos a string para obtermos apenas o número
    desconto = desconto.to_f
    puts "Valor Desconto: " + desconto.to_s
    expect(desconto).not_to eq(0.0)
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

  Então(/^deslizo até o início do carrinho$/) do
    q = query("* marked:'Deslize os itens para remover do carrinho'")
    scrolls = 0
      while (q.empty? && scrolls < 10)
        scroll("* id:'recycler_view'", :up)
        q = query("* marked:'Deslize os itens para remover do carrinho'")
        scrolls = scrolls + 1
      end
  end


Então(/^o desconto deve ter sido removido$/) do
  desconto = (query Elementos::Carrinho::Desconto, :text).first
  expect(desconto).to eq("R$ 0,00")
end

Então(/^posso visualizar o Vale\-Compras$/) do
  valor_vale = (query Elementos::Carrinho::Vale_Compras, :text).first
  valor_vale.slice! "R$ " #Cortamos a string para obtermos apenas o número
  valor_vale = valor_vale.to_f
  puts "Valor do Vale: " + valor_vale.to_s
  expect(valor_vale).not_to eq(0.0)
end

Então(/^o Vale\-Compras deve ter sido removido$/) do
  valor_vale = (query Elementos::Carrinho::Vale_Compras, :text).first
  expect(valor_vale).to eq("R$ 0,00")
end

Dado(/^que há itens no carrinho$/) do
  itens = (query Elementos::Carrinho::Array_Nome_Produto)
  expect(itens).not_to be_empty
end

Então(/^tiro todos os itens do carrinho$/) do
  itens = query "* id:'product_item'"
  itens.each do |item|
    pan("* id:'product_item'", :right)
    sleep 3
  end

  itens = query "* id:'product_item'"
  expect(itens).to be_empty
end
