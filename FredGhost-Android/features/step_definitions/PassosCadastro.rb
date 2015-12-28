# encoding: utf-8
require 'calabash-android/calabash_steps'
require 'date'

@cpf = ""
@email = ""

Então(/^preencho o campo CPF$/) do
  @cpf = Utilidades.geraCPF
  touch Elementos::CadastroPF::Cpf
  keyboard_enter_text(@cpf)
  @email = @cpf
end

Então(/^escolho a data do campo "([^"]*)" com o dia "([^"]*)", mês "([^"]*)" e ano "([^"]*)"$/) do |campo, dia, mes, ano|
  touch Elementos::CadastroPF::DataDeNascimento

  sleep(2)
  touch Elementos::Calendario::Ano
  #Desliza até o ano
  q = query("* marked:'#{ano}'")
    while q.empty?
      scroll_up
      q = query("* marked:'#{ano}'")
    end

  touch("* text:'#{ano}'")

  #Desliza até o mes
  touch Elementos::Calendario::Mes
  mesAtual = Date.today.month.to_i
  mes = mes.to_i
  scrolls = (mes - mesAtual).abs

  if(mes < mesAtual)
    for i in 0..(scrolls-1) # mes atrás
      scroll_up
    end
  elsif(mes > mesAtual)
    for i in 0..(scrolls-1) #mes a frente
      scroll_down
    end



  end

  # # TODO : selecionar o dia correto
  #
  # tap_mark dia

  touch "* index:0" #Toca em um dia
  ##

  tap_mark "OK"
end


Então(/^seleciono o Sexo "([^"]*)"$/) do |sexo|
  touch Elementos::CadastroPF::Sexo
  tap_mark sexo

end

Então(/^espero a rua ser preenchida$/) do
  wait_for(:timeout => 10) { query(Elementos::CadastroEndereco::Rua , :text).first.length > 0 } #Espera 10 segundos até que a Rua esteja preenchida
end

Então(/^preencho o campo Email com o gerado e o dominio "([^"]*)"$/) do |dominio|
  touch Elementos::CadastroDadosDeAcesso::Email
  #keyboard_enter_text(@cpf + dominio)

  @email = @email + dominio #Somente cpf ou cnpj terá um valor

  keyboard_enter_text(@email)
end

Então(/^aguardo "([^"]*)" segundos$/) do |segundos|
  sleep(segundos.to_i)
end

Então(/^verifico se estou logado com meu novo email$/) do
  assert_text @email
end

Então(/^preencho o campo CNPJ$/) do
  @cnpj = Utilidades.geraCNPJ
  #touch Elementos::CadastroPJ::Cnpj
  #sleep 2
  keyboard_enter_text(@cnpj)
  @email = @cnpj
end
