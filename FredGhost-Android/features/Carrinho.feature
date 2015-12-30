# language: pt
@carrinho @reset
Funcionalidade: Validar Carrinho

Contexto: Adicionando Itens

  Dado que estou na tela inicial
  Quando clicar em pesquisar
  E preencho a busca com "Tenis Bout"
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

@quantidade
Cenário: Alterar quantidade

  Dado que estou no carrinho
  Então posso visualizar os itens no carrinho
  Quando clico na quantidade do item "1"
  E clico em "4"
  Então a quantidade e o preço do item "1" deverá ter mudado

@itens_diferentes
Cenário: Itens diferentes no carrinho

Dado que estou no carrinho
E posso visualizar os itens no carrinho
E que tenho mais de "1" item no carrinho
Então posso visualizar os dados dos itens

@exibicao_produtos
Cenário: Verificar a exibição dos produtos - Nome, Tamanho, Cor, Valor
Dado que estou no carrinho
E posso visualizar os itens no carrinho
Então posso visualizar os dados dos itens

@refresh
Cenário: Dar refresh no carrinho e verificar os itens
Dado que estou no carrinho
E posso visualizar os itens no carrinho
E saio do carrinho
E volto ao carrinho
Então devo visualizar os mesmos itens de antes
