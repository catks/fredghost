# encoding: utf-8
Before do |scenario|
  $tagerros ||= [] #seta o valor como um array vazio se ele ainda não ter sido instanciado
  scenario_tags = scenario.source_tag_names
  #pula os cenarios que contem tags que estão em tagerros

  #lambda em varias linhas
  #  verifica_tag_lambda = lambda do |tag|
  #    if scenario_tags.include?(tag)
  #      skip_this_scenario
  #      #pending
  #    end
  #  end
  #  $tagerros.each &verifica_tag_lambda

  #lambda em uma linha
   #$tagerros.each(lambda { |tag| scenario_tags.include?(tag) ? skip_this_scenario : nil } )
   lambda_verifica_tags = lambda { |tag| skip_this_scenario if scenario_tags.include?(tag) }
   $tagerros.each &lambda_verifica_tags
end

Around do |scenario, block|
  $timeout = 10 # timeout em minutos  por cenário (padrão é 10)
  begin
    Timeout.timeout($timeout * 60) do #transforma o timeout em segundos
      block.call
    end
  rescue
    raise "Timeout Atingido, o teste demorou mais de #{$timeout} minutos"
  end
end

After do |scenario|

  #Tags Especiais
  scenario_tags = scenario.source_tag_names #recupera as tags do scenario atual

  #Tag: skip_all_if_failed
  # => Pula todos os testes se esse teste falhas
  if scenario_tags.include?('@skip_all_if_failed')
     Cucumber.wants_to_quit = true if scenario.failed?
  end
  #Tag skip_feature_if_failed
  # => Pula todos os testes da feature atual contanto que ela tenha uma tag que é herdada por todos os testes
  if scenario.failed?
    if scenario_tags.include?('@skip_feature_if_failed')
      $tagerros << scenario_tags[0] #pega a primeira tag que é a tag da feature herdada por todos os testes da mesma
    end
  end

end
