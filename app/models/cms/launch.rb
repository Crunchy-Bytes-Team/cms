module Cms
  class Launch < ApplicationRecord
    include Visibility

    translates :title, :subtitle

    belongs_to :target, :polymorphic => true

    mount_uploader :image, ImageUploader
    mount_uploader :background_image, ImageUploader
    mount_uploader :attachment, FileUploader

    validates :title,
      presence: true,
      allow_blank: false,
      length: {maximum: 250}

    after_initialize do
      if new_record?
        self.target_mode = 'Free'
      end
    end

  end
end
