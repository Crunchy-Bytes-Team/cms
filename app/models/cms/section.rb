module Cms
  class Section < ActiveRecord::Base
    include Visibility
    extend FriendlyId

    translates :name, :slug
    friendly_id :name, use: [:slugged, :globalize]

    has_one :menu_entry, as: :target

    validates :code,
      uniqueness: true,
      allow_blank: false,
      presence: true,
      length: {
        minimum: 3
      },
      format: {
        :with => /\A[a-zA-Z0-9\_\.\-]+\z/,
        :message => "non può contenere numeri o spazi"
      }

    validates :name,
      presence: true,
      allow_blank: false,
      uniqueness: true,
      length: {maximum: 200}

    validates_uniqueness_of :slug

    has_many :pages, dependent: :destroy

    def landing_page
      pages.landing_for_section(self.name).first rescue nil
    end
  end
end
