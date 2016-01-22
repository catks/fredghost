require 'calabash-android/management/adb'
require 'calabash-android/operations'

Before do |scenario|
  scenario_tags = scenario.source_tag_names
  if scenario_tags.include?('@reset')
     clear_app_data
  end

  start_test_server_in_background

end

After do |scenario|
  scenario_tags = scenario.source_tag_names
  if scenario.failed?
    screenshot_embed
  end
  shutdown_test_server unless scenario_tags.include?('@dont_shutdown') #não fecha o servidor de testes apos a execução do cenário
end
