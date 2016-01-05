# language: pt
@carrinho
Funcionalidade: Validar Carrinho

@reset @quantidade @itens_diferentes @exibicao_produtos @refresh @frete @cupom @vale @apagar
Cenário: Adicionando Itens

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

@frete
Cenário: Calcular o frete e prazo de entrega
Dado que estou no carrinho
E posso visualizar os itens no carrinho
Então deslizo até o fim do carrinho
E clico em "Frete e prazo de entrega"
E preencho o campo "CEP" com "05038-090"
E aguardo "2" segundos
E clico em "Enviar"
E espero carregar
Então posso visualizar o frete
E deslizo até o início do carrinho
E visualizo o prazo de cada item do carrinho

@cupom
Cenário: Inserir cupom de desconto
Dado que estou no carrinho
E posso visualizar os itens no carrinho
Então deslizo até o fim do carrinho
E clico em "Cupom de desconto"
E preencho o campo "Cupom de desconto" com "15OFFCONS"
E clico em "Enviar"
E espero carregar
Então posso visualizar o desconto
E clico em "Remover cupom de desconto"
Então espero carregar
E o desconto deve ter sido removido


@vale
Cenário: Inserir cupom de desconto
Dado que estou na tela inicial
Quando clicar no menu lateral
Então clico em "Entre ou cadastre-se, clique aqui!"
Então devo me logar com email "mobile@fredautomation.com.br" e com senha "123"
Dado que estou no carrinho
E posso visualizar os itens no carrinho
Então deslizo até o fim do carrinho
E clico em "Vale-Compras"
E preencho o campo "Vale-Compras" com "62b7e3"
E clico em "Enviar"
E espero carregar
Então posso visualizar o Vale-Compras
E clico em "Remover vale-Compras"
Então espero carregar
E o Vale-Compras deve ter sido removido

@apagar
Cenário: Apagar itens
Dado que estou no carrinho
E que há itens no carrinho
Então tiro todos os itens do carrinho
