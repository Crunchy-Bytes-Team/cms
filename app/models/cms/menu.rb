module Cms
  class Menu < ApplicationRecord
    include Visibility

    translates :title

    has_many :menu_entries
    accepts_nested_attributes_for :menu_entries

    before_save :check_main

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

    class << self
      def main
        where(main: true).first rescue nil
      end
    end

    def check_main
      if self.main && self.main_changed?
        #unset previous choosed homepage
        m = Menu.main
        unless m.nil?
          m.main = false
          m.save
        end
      end
    end

  end

end
