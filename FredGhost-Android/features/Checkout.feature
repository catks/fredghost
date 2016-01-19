# language: pt
@checkout
Funcionalidade: Validar Checkout

@enderecos @frete @novo_cartao @reset @skip_feature_if_failed
Cenário: Adicionando Item ao Carrinho
Dado que estou na tela inicial
Quando clicar no menu lateral
Então clico em "Entre ou cadastre-se, clique aqui!"
Então devo me logar
Quando clicar em pesquisar
E preencho a busca com "Tenis Bout Sense 6516C"
Então posso clicar no primeiro item
E escolho o tamanho "39"
E clico no botão circular para adicionar ao Carrinho
Então posso visualizar o item "Tênis" no carrinho

@enderecos
Cenário: Validar Endereços de Entrega
Dado que estou na tela de checkout
Então vejo que meu endereço está sendo exibido
E clico em "Toque para alterar"
E clico no endereço "2"
E vejo que o endereço mudou para meu endereço selecionado
E clico em "Toque para alterar"
Então deslizo para baixo até que eu veja o "Adicionar novo endereço"
E clico em "Adicionar novo endereço"
E preencho o campo Nome do Endereço com um numero aleatorio
E preencho o campo "Quem vai receber?" com "Testador Jr"
E preencho o campo "CEP" com "04795-000"
E preencho o campo "Número" com "190"
E preencho o campo "Telefone" com "115555-5551"
E clico em "Adicionar"
E vejo que o endereço foi adicionado

@frete
Cenário: Validar Opções de Frete
  Dado que estou na tela de checkout
  E seleciono a opção de entrega "Entrega Agendada"
  E clico em "Selecionar"
  E clico em "Manhã"
  E clico em "Selecionar"
  Então vejo que o prazo e valor de ambas as Entregas estão sendo exibidos

@novo_cartao
Cenário: Validar Novo Cartão
  Dado que estou na tela de checkout
  E seleciono a opção de entrega "Entrega Convencional"
  Então vejo que a opção "Cartão de Crédito" está sendo exibido
  E seleciono a forma de pagamento como "Cartão de Crédito"
  Então deslizo para baixo até que eu veja o "Adicionar Cartão"
  Então clico em "Adicionar Cartão"
  E visualizo os campos para adicionar um novo cartão
  E visualizo as bandeiras dos cartões

  E preencho o dados do cartão com Titular: "Fred Automation", N° do cartão: "5555555555555555", Mês: "12", Ano: "2025", CVC:"123"
  Então clico em "Adicionar"
  Mas continuo na tela de adicionar cartão pois o número está errado

  E preencho o dados do cartão com Titular: "Fred Automation", N° do cartão: "4001783473486878", Mês: "11", Ano: "2025", CVC:"123"
  Então clico em "Adicionar"
  Mas continuo na tela de adicionar cartão pois o mês está errado

  E preencho o dados do cartão com Titular: "Fred Automation", N° do cartão: "4001783473486878", Mês: "12", Ano: "2024", CVC:"123"
  Então clico em "Adicionar"
  Mas continuo na tela de adicionar cartão pois o ano está errado

  E preencho o dados do cartão com Titular: "Fred Automation", N° do cartão: "4001783473486878", Mês: "12", Ano: "2025", CVC:"124"
  Então clico em "Adicionar"
  Mas continuo na tela de adicionar cartão pois o CVC está errado

  E preencho o dados do cartão com Titular: "Fred Automation", N° do cartão: "4001783473486878", Mês: "12", Ano: "2025", CVC:"123"
  Então clico em "Adicionar"
  E clico no botão circular para finalizar o pedido
  E vejo a tela de resumo de compra

@pagamento @boleto @reset
Cenário: Validar Pagamento com Boleto
  Dado que estou na tela inicial
  Quando clicar no menu lateral
  Então clico em "Entre ou cadastre-se, clique aqui!"
  Então devo me logar
  Quando clicar em pesquisar
  E preencho a busca com "Tenis Bout Sense 6516C"
  Então posso clicar no primeiro item
  E escolho o tamanho "39"
  E clico no botão circular para adicionar ao Carrinho
  Então posso visualizar o item "Tênis" no carrinho
  E clico no botão circular de pagamento
  E seleciono a opção de entrega "Entrega Convencional"
  Então vejo que a opção "Boleto Bancário" está sendo exibido
  E seleciono a forma de pagamento como "Boleto"
  E clico no botão circular para finalizar o pedido
  E vejo a tela de resumo de compra

  @pagamento @cartao @reset
  Cenário: Validar Pagamento com Cartão
      Dado que estou na tela inicial
      Quando clicar no menu lateral
      Então clico em "Entre ou cadastre-se, clique aqui!"
      Então devo me logar
      Quando clicar em pesquisar
      E preencho a busca com "Tenis Bout Sense 6516C"
      Então posso clicar no primeiro item
      E escolho o tamanho "39"
      E clico no botão circular para adicionar ao Carrinho
      Então posso visualizar o item "Tênis" no carrinho
      E clico no botão circular de pagamento
      E seleciono a opção de entrega "Entrega Convencional"
      Então vejo que a opção "Cartão de Crédito" está sendo exibido
      E seleciono a forma de pagamento como "Cartão de Crédito"
      Então deslizo para baixo até que eu veja o "Adicionar Cartão"
      Então clico em "Adicionar Cartão"
      E preencho o dados do cartão com Titular: "Fred Automation", N° do cartão: "4001783473486878", Mês: "12", Ano: "2025", CVC:"123"
      Então clico em "Adicionar"
      E clico no botão circular para finalizar o pedido
      E vejo a tela de resumo de compra

      @testes
      Cenario:testes
      Então visualizo as bandeiras dos cartões
