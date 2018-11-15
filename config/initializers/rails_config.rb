# -*- encoding : utf-8 -*-
Config.setup do |config|
  config.const_name = "Settings"
end
additional_config_paths.each{|path| Settings.add_source!(path)}
Settings.reload!
