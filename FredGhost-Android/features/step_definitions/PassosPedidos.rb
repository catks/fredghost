# encoding: utf-8
require 'calabash-android/calabash_steps'

Então(/^preencho o dados do cartão com Titular: "([^"]*)", N° do cartão: "([^"]*)", Mês: "([^"]*)", Ano: "([^"]*)", CVC:"([^"]*)"$/) do |titular, numCartao, mes, ano, cvc|
  #titular
  tap_mark 'Titular do Cartão'
  clear_text
  keyboard_enter_text(titular)

  #Numero do Cartão
  tap_mark 'Número do Cartão'
  clear_text
  keyboard_enter_text(numCartao)

  #MES
  touch("* id:'card_month'")

  #Desliza até o mes
  q = query("* text:'#{mes}'")
    while q.empty?
      scroll_down
      q = query("* text:'#{mes}'")
    end

  touch("* text:'#{mes}'")


  #ANO
  touch("* id:'card_year'")

  #Desliza até o ano
  q = query("* text:'#{ano}'")
    while q.empty?
      scroll_down
      q = query("* text:'#{ano}'")
    end

  touch("* text:'#{ano}'")

  #CVC

  tap_mark('CVC')
  keyboard_enter_text(cvc)

end

#Para a tela de Compra rápida Tela Conclua seu Pedido
Então(/^seleciono a data para o mês "([^"]*)" e ano "([^"]*)"$/) do |mes, ano|
  touch "* id:'card_month'"
  deslizar_para_baixo_ate(mes)
  tap_mark mes
  touch "* id:'card_year'"
  deslizar_para_baixo_ate(ano)
  tap_mark ano
end


Então(/^vejo a tela de resumo de compra$/) do
  wait_for_element_does_not_exist("ProgressBar", :timeout => 60)
  #check_element_does_not_exist("* id:'snackbar_text'")
  #wait_for(timeout: 60) { element_exists "* marked:'Resumo de Compra'" }
  assert_text('Resumo de Compra')
  assert_text('Pedido Concluído')
end
