# encoding: utf-8
require 'calabash-android/calabash_steps'

Então(/^seleciono a opção de entrega "(Entrega Convencional|Entrega Agendada)"$/) do |tipoEntrega|
#Então(/^selecionar a opção de entrega "([^"]*)"$/) do |tipoEntrega|
  wait_for(timeout: 10) { element_exists "* id:'radio'" }
  if tipoEntrega.downcase  == "entrega convencional"
    touch(query("* id:'radio'")[0])
  elsif tipoEntrega.downcase  == "entrega agendada"
    touch(query("* id:'radio'")[1])
  end

end

Então(/^seleciono a forma de pagamento como "([^"]*)"$/) do |tipoPagamento|

  # TODO: Melhorar o jeito de achar a radio certa
  sleep(3)
  wait_for(timeout: 15) { element_exists "* id:'radio'" }
  if tipoPagamento.downcase.include? "boleto"
    check_element_exists("* marked:'Boleto Bancário'")
    touch(query("* id:'radio'")[2])

  elsif tipoPagamento.downcase.include? "cartão"
    if (element_does_not_exist("* marked:'Boleto Bancário'")) # Se não tiver a opção de boleto
      touch(query("* id:'radio'")[2])
    else
      touch(query("* id:'radio'")[3])
    end

  end
end



Então(/^preencho o dados do cartão com Titular: "([^"]*)", N° do cartão: "([^"]*)", Mês: "([^"]*)", Ano: "([^"]*)", CVC:"([^"]*)"$/) do |titular, numCartao, mes, ano, cvc|
  #titular
  tap_mark 'Titular do Cartão'
  keyboard_enter_text(titular)

  #Numero do Cartão
  tap_mark 'Número do Cartão'
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
