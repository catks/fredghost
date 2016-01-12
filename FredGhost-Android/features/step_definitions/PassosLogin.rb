# encoding: utf-8
require 'calabash-android/calabash_steps'

Então(/^devo me logar(?: com email "([^"]*)" e com senha "([^"]*)")?$/) do |email,senha|

  #valores default
  email ||= "prd-fred.automation@gmail.com"
  senha ||= "123"
  #
  #Vamos armazenar como variaveis de instancia desse teste
  @email = email
  @senha = senha
  #

  wait_for(timeout: 10) { element_exists '* marked:"Email"' }
  tap_mark 'Email'
  keyboard_enter_text(email)
  tap_mark 'Senha'
  keyboard_enter_text(senha)
  tap_mark 'Entrar'
end

Então(/^devo ver uma mensagem de erro$/) do
  wait_for_element_exists("* id:'sb__text'" , :timeout => 10)
end
