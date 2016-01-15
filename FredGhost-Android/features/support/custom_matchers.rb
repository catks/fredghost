# encoding: utf-8
require 'rspec/expectations'
require 'calabash-android/calabash_steps'
#Valida se é um preço
RSpec::Matchers.define :be_a_price do
  match do |actual|
    #Regex para validar se é um preço
    expect(actual).to match_regex(/R\$[\s]*[0-9]+,[0-9]{2}/)
  end
  failure_message do |actual|
    "Esperado que #{actual} fosse um preço"
  end
end

#valida se o item existe na página
  RSpec::Matchers.define :exist_in_page do
    match do |actual|
      #Regex para validar se é um preço
      result = query actual
      result.size > 0
    end
    failure_message do |actual|
      "O elemento #{actual} não foi encontrado na página"
    end

    failure_message_when_negated do |actual|
      "O elemento #{actual} não deveria ser  encontrado na página"
    end
end

RSpec::Matchers.define :have_words do |expected = 10|
  match do |actual|
    #default
    #expected ||= 10 # no minimo 10 palavras
    #
    content = (query actual , :text).first #pega o texto do elemento
    words = content.split.size
    words >= expected
  end

  failure_message do |actual|
      "O elemento #{actual} não foi encontrado na página"
  end

  failure_message_when_negated do |actual|
      "O elemento #{actual} não deveria ser  encontrado na página"
  end
end
