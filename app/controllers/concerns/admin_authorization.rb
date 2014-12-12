module AdminAuthorization
  extend ActiveSupport::Concern

  included do
    before_filter :require_admin, if: :rails_admin?

    protected

    def require_admin
      if current_user && current_user.role != 10
        flash[:error] = "You are not authorized"
        redirect_to Rails.application.routes.url_helpers.root_path I18n.locale
      end
    end

    def rails_admin?
      controller_path =~ /rails_admin/
    end

  end
end
