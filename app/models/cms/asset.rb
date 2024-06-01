module Cms
  class Asset < ApplicationRecord
    include Visibility

    mount_uploader :data, ImageUploader

    belongs_to :assettable, polymorphic: true, touch: true
    before_save :update_asset_attributes, if: :update_asset_attributes?

    scope :highlighted, -> {where(highlight: true)}

    #validates :data, presence: true
    #mount_uploader :data, ImageBaseUploader

    def update_asset_attributes?
      data.present? && data_changed?
    end

    def full_link
      "http://#{self.destination_url.gsub("http://", "")}"
    end

    def self.text_color_enum
      [
        ['Corporate blue','blue'],
        ['Basic white','white'],
        ['Acid green','green'],
      ]
    end

    protected

    def update_asset_attributes
      self.content_type = data.file.content_type
      self.file_size = data.file.size
    end
  end
end
