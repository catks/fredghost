# language: pt
@pedidos
Funcionalidade: Finalizar Pedidos

@esquema @mono
Esquema do Cenário: Posso Finalizar Pedidos com Visa
  Dado que estou na tela inicial
  Quando clicar no menu lateral
  Então clico em "Entre ou cadastre-se, clique aqui!"
  Então devo me logar com email "<email>" e com senha "<senha>"
  Quando clicar em pesquisar
  E preencho a busca com "Tenis Bout Sense"
  Então posso clicar no primeiro item
  E escolho o tamanho "39"
  E clico no botão circular para adicionar ao Carrinho
  Então posso visualizar o item "Tênis" no carrinho
  E clico no botão circular de pagamento
  E seleciono a opção de entrega "Entrega Convencional"
  E seleciono a forma de pagamento como "Cartão de Crédito"
  Então deslizo para baixo até que eu veja o "Adicionar Cartão"
  Então clico em "Adicionar Cartão"
  E preencho o dados do cartão com Titular: "Fred Automation", N° do cartão: "<n_cartao>", Mês: "<Mes>", Ano: "<Ano>", CVC:"<CVC>"
  Então clico em "Adicionar"
  E clico no botão circular para finalizar o pedido
  E vejo a tela de resumo de compra

  @visa @reset
  Exemplos:
    |email                        |senha|n_cartao           |Mes|Ano   |CVC|
    |prd-fred.automation@gmail.com|123  |4001783473486878   |12 |2025  |123|
  @mastercard @reset
  Exemplos:
    |email                        |senha|n_cartao           |Mes|Ano   |CVC|
    |prd-fred.automation@gmail.com|123  |5453010000066167   |12 |2024  |123|
  @dinners @reset
  Exemplos:
    |email                        |senha|n_cartao           |Mes|Ano   |CVC|
    |prd-fred.automation@gmail.com|123  |36490102462661     |05 |2018  |123|


#Visa
@visa @mono
Cenário: Posso Finalizar Pedidos com Visa
Dado que estou na tela inicial
Quando clicar no menu lateral
Então clico em "Entre ou cadastre-se, clique aqui!"
Então devo me logar
Quando clicar em pesquisar
E preencho a busca com "Tenis Bout Sense"
Então posso clicar no primeiro item
E escolho o tamanho "39"
E clico no botão circular para adicionar ao Carrinho
Então posso visualizar o item "Tênis" no carrinho
E clico no botão circular de pagamento
E seleciono a opção de entrega "Entrega Convencional"
E seleciono a forma de pagamento como "Cartão de Crédito"
Então deslizo para baixo até que eu veja o "Adicionar Cartão"
Então clico em "Adicionar Cartão"
E preencho o dados do cartão com Titular: "Fred Automation", N° do cartão: "4001783473486878", Mês: "12", Ano: "2025", CVC:"123"
Então clico em "Adicionar"
E clico no botão circular para finalizar o pedido
E vejo a tela de resumo de compra



@visa @multi @perso
Cenário: Posso Finalizar Pedidos com Visa
Dado que estou na tela inicial
Quando clicar no menu lateral
Então clico em "Entre ou cadastre-se, clique aqui!"
Então devo me logar

Quando clicar em pesquisar
E preencho a busca com "Tenis Bout Sense"
Então posso clicar no primeiro item
E escolho o tamanho "39"
E clico no botão circular para adicionar ao Carrinho
E volto a tela
E volto a tela

Quando clicar em pesquisar
E preencho a busca com "chinelo melhor"
Então posso clicar no primeiro item
E escolho o tamanho "42"
E clico no botão circular para adicionar ao Carrinho

Então posso visualizar o item "Chinelo" no carrinho
E clico no botão circular de pagamento
E seleciono a opção de entrega "Entrega Convencional"
E seleciono a forma de pagamento como "Cartão de Crédito"
Então deslizo para baixo até que eu veja o "Adicionar Cartão"
Então clico em "Adicionar Cartão"
E preencho o dados do cartão com Titular: "Fred Automation", N° do cartão: "4001783473486878", Mês: "12", Ano: "2025", CVC:"123"
Então clico em "Adicionar"
E clico no botão circular para finalizar o pedido
E vejo a tela de resumo de compra

#####################################

@mastercard @mono
Cenário: Posso Finalizar Pedidos com masterCard
Dado que estou na tela inicial
Quando clicar no menu lateral
Então clico em "Entre ou cadastre-se, clique aqui!"
Então devo me logar
Quando clicar em pesquisar
E preencho a busca com "Tenis Bout Sense"
Então posso clicar no primeiro item
E escolho o tamanho "39"
E clico no botão circular para adicionar ao Carrinho
Então posso visualizar o item "Tênis" no carrinho
E clico no botão circular de pagamento
E seleciono a opção de entrega "Entrega Convencional"
E seleciono a forma de pagamento como "Cartão de Crédito"
Então deslizo para baixo até que eu veja o "Adicionar Cartão"
Então clico em "Adicionar Cartão"
E preencho o dados do cartão com Titular: "Fred Automation", N° do cartão: "5453010000066167", Mês: "12", Ano: "2024", CVC:"123"
Então clico em "Adicionar"
E clico no botão circular para finalizar o pedido
E vejo a tela de resumo de compra

@dinners @mono
Cenário: Posso Finalizar Pedidos com Dinners
Dado que estou na tela inicial
Quando clicar no menu lateral
Então clico em "Entre ou cadastre-se, clique aqui!"
Então devo me logar
Quando clicar em pesquisar
E preencho a busca com "Tenis Bout Sense"
Então posso clicar no primeiro item
E escolho o tamanho "39"
E clico no botão circular para adicionar ao Carrinho
Então posso visualizar o item "Tênis" no carrinho
E clico no botão circular de pagamento
E seleciono a opção de entrega "Entrega Convencional"
E seleciono a forma de pagamento como "Cartão de Crédito"
Então deslizo para baixo até que eu veja o "Adicionar Cartão"
Então clico em "Adicionar Cartão"
E preencho o dados do cartão com Titular: "Fred Automation", N° do cartão: "36490102462661", Mês: "05", Ano: "2018", CVC:"123"
Então clico em "Adicionar"
E clico no botão circular para finalizar o pedido
E vejo a tela de resumo de compra
