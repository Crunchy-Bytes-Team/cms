module Cms
  class MenuEntry < ActiveRecord::Base
    include Visibility

    translates :title

    belongs_to :menu
    belongs_to :target, :polymorphic => true

    after_initialize do
      if new_record?
        self.target_mode = 'Free'
      end
    end

    def self.destination_enum
      [["Stessa finestra", "_self"], ["Nuova finestra", "_blank"]]
    end
  end
end
