app_config  = "#{Rails.root}/config/global"
core_config = "#{Cms::Engine.root}/config/global"

Global.environment = Rails.env.to_s
Global.config_directory = File.exist?(app_config) ? app_config : core_config
