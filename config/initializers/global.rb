app_config  = "#{Rails.root}/config/global"
core_config = "#{Cms::Engine.root}/config/global"

Global.configure do |config|
  config.backend :filesystem
end
