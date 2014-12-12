module DynamicConfig
  extend ActiveSupport::Concern

  included do

    def rails_admin_path?
     controller_path =~ /rails_admin/
    end

    def reload_rails_admin
      if Rails.env.development? && rails_admin_path?
        models = RailsAdmin.config.instance_variable_get("@included_models")
        models.each do |m|
          RailsAdmin::Config.reset_model(m)
        end
        RailsAdmin::Config::Actions.reset
        load("#{Rails.root}/config/initializers/rails_admin.rb")
      end
    end
  end
end
