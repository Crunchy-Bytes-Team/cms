#encoding: UTF-8
module MultiLanguage
  extend ActiveSupport::Concern

  included do

    before_filter :set_locale #must be the first

    # I18n stuff
    def set_locale
      if params[:locale].present?
        I18n.locale = current_locale
      #   Globalize.fallbacks = {
      #     :en => [:en, :it],
      #     :it => [:it],
      #     :fr => [:fr, :it],
      #     :de => [:de, :it],
      #     :es => [:es, :it],
      #     :zh => [:zh, :it],
      #     :ru => [:ru, :it],
      #     :pt => [:pt, :it],
      #     :tr => [:tr, :it]
      #   }
      # else
        redirect_to root_path(locale: user_default_locale), status: 301 unless :rails_admin?
      end
    end

    def current_locale
      supported_locale?(params[:locale].to_sym) ? params[:locale].to_sym : I18n.default_locale
    end

    def supported_locale?(locale)
      I18n.available_locales.include?(locale.to_s.to_sym)
    end

    def default_url_options(options = {})
      unless controller_path =~ /rails_admin/
        custom_options = { locale: I18n.locale}
        custom_options.merge(options)
      else
        options
      end
    end

  end
end
