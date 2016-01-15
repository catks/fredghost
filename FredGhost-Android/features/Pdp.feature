# language: pt
@pdp
Funcionalidade: Validar Pdp

@esquema
Esquema do Cenário: Validar itens na PDP
  Dado que estou na tela inicial
  Quando clicar em pesquisar
  E preencho a busca com "<pesquisa>"
  Então posso clicar no primeiro item
  E espero carregar
  E posso visualizar o nome do produto "<nome_produto>" no topo
  E posso visualizar as imagens
  E posso visualizar o preço
  #E posso visualizar as cores disponíveis
  E posso visualizar os tamanhos disponíveis
  E posso visualizar a descrição
  E posso visualizar as avaliações
  @tenis
  Exemplos:
    |pesquisa        |nome_produto |
    |Tênis Bout Sense|Tênis Bouts|

@tenis
Cenário: Validar itens na PDP
  Dado que estou na tela inicial
  Quando clicar em pesquisar
  E preencho a busca com "Tênis Bouts"
  Então posso clicar no primeiro item
  E espero carregar
  E posso visualizar o nome do produto "Tênis Bouts" no topo
  E posso visualizar as imagens
  E posso visualizar o preço
  #E posso visualizar as cores disponíveis
  E posso visualizar os tamanhos disponíveis
  E posso visualizar a descrição
  E posso visualizar as avaliações

@compra_rapida
Cenario: Validar Botão de Compra Rápida
  Dado que estou na tela inicial
  Quando clicar no menu lateral
  Então clico em "Entre ou cadastre-se, clique aqui!"
  E devo me logar com email "testesbnet@a.com" e com senha "123"
  Quando clicar em pesquisar
  E preencho a busca com "Tênis Bouts Sense 6516C"
  Então posso clicar no primeiro item
  E espero carregar
  E escolho um tamanho qualquer
  E clico no botão circular para adicionar ao Carrinho
  E visualizo o botão de compra rápida e de checkout
  Então clico no botão de compra rápida
  E vejo que estou na tela "Conclua seu Pedido"
  E seleciono a data para o mês "12" e ano "2024"
  E clico no botão circular para finalizar o pedido
  E vejo a tela de resumo de compra

  @compra_normal
  Cenario: Validar Botão de Compra Normal
    Dado que estou na tela inicial
    Quando clicar no menu lateral
    Então clico em "Entre ou cadastre-se, clique aqui!"
    E devo me logar com email "testesbnet@a.com" e com senha "123"
    Quando clicar em pesquisar
    E preencho a busca com "Tênis Bouts Sense 6516C"
    Então posso clicar no primeiro item
    E espero carregar
    E escolho um tamanho qualquer
    E clico no botão circular para adicionar ao Carrinho
    E visualizo o botão de compra rápida e de checkout
    Então clico no botão continuar para o checkout
    E vejo que estou na tela "Carrinho"
    E clico no botão circular para continuar
    E seleciono a opção de entrega "Entrega Convencional"
    E seleciono a forma de pagamento como "Boleto Bancário"
    E clico no botão circular para finalizar o pedido
    E vejo a tela de resumo de compra
