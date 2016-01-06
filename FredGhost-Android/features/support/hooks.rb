After do |scenario|

  #Tags Especiais
  scenario_tags = scenario.source_tag_names
  #Tag skip_all_if_failed
  if scenario_tags.include?('@skip_all_if_failed')
     Cucumber.wants_to_quit = true if scenario.failed?
  end

end
