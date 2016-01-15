# encoding: utf-8
require 'calabash-android/calabash_steps'

Então(/^posso visualizar o nome do produto "([^"]*)" no topo$/) do |nome_produto|
  #sleep 2
  wait_for(timeout: 10) { element_exists Elementos::Pdp::Nome_Produto }
  nome_obtido = (query Elementos::Pdp::Nome_Produto , :text).first
  puts "Nome: #{nome_obtido}"
  expect(nome_obtido).to include(nome_produto)

end


Então(/^posso visualizar as imagens$/) do
  imagem = Elementos::Pdp::Imagem
  expect(imagem).to exist_in_page
  #valida as duas proximas imagens
  2.times do
    pan imagem , :left #Desliza a galeria
    expect(imagem).to exist_in_page
  end

end

Então(/^posso visualizar o preço$/) do
  preco_de = (query Elementos::Pdp::Preco_De , :text).first
  preco_por = (query Elementos::Pdp::Preco_Por , :text).first

  puts "Preço De: #{preco_de}"
  puts "Preço Por: #{preco_por}"
  #expect(preco_de).to match (/R\$[\s]*[0-9]+,[0-9]{2}/)
  #expect(preco_por).to match (/R\$[\s]*[0-9]+,[0-9]{2}/)
  expect(preco_de).to be_a_price
  expect(preco_por).to be_a_price
end

Então(/^posso visualizar as cores disponíveis$/) do
  pending # Ainda não é possível voisualizar as cores pois o elemento não possui id
end

Então(/^posso visualizar os tamanhos disponíveis$/) do
  touch Elementos::Pdp::Tamanho
  sleep 2
  expect(Elementos::Pdp::Tamanhos::Disponiveis).to exist_in_page
  puts "Tamanhos Disponiveis"
  (query Elementos::Pdp::Tamanhos::Disponiveis , :text).each do |tamanho|
    puts tamanho
  end
end

Então(/^escolho o tamanho "([^"]*)"$/) do |tamanho|
  tap_mark 'Tamanho'
  sleep 2
  tap_mark tamanho
end

Então(/^posso visualizar a descrição$/) do
  scroll_down
  touch Elementos::Pdp::Aba_Descricao
  #touch Elementos::Pdp::Descricao
  #TODO: Melhorar para visualizar o ver mais
  expect(Elementos::Pdp::Descricao).to have_words
end


Então(/^posso visualizar as avaliações$/) do
  touch Elementos::Pdp::Aba_Avaliacoes
  touch Elementos::Pdp::Avaliacoes_Ver_Todos

  expect(Elementos::Pdp::VerTodasAvaliacoes::Autores).to exist_in_page
  expect(Elementos::Pdp::VerTodasAvaliacoes::Titulos).to exist_in_page
  expect(Elementos::Pdp::VerTodasAvaliacoes::Conteudo).to exist_in_page
end

Então(/^escolho um tamanho qualquer$/) do
  touch Elementos::Pdp::Tamanho
  sleep 2
  touch Elementos::Pdp::Tamanhos::Disponiveis
end

Então(/^visualizo o botão de compra rápida e de checkout$/) do
  wait_for_element_exists(Elementos::Pdp::Compra::Rapida, :timeout => 5)
  wait_for_element_exists(Elementos::Pdp::Compra::Checkout, :timeout => 5)
end

Então(/^clico no botão de compra rápida$/) do
  sleep 1
  touch Elementos::Pdp::Compra::Rapida
end

Então(/^clico no botão continuar para o checkout$/) do
  sleep 1
  touch Elementos::Pdp::Compra::Checkout
end
