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
    |Tênis Bout Sense|"Tênis Bouts"|

@df
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
