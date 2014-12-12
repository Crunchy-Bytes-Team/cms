module Cms
  class Document < ActiveRecord::Base
    include Visibility

    belongs_to :documentable, polymorphic: true
    before_save :update_asset_attributes, if: :update_asset_attributes?

    mount_uploader :data, FileUploader

    def update_asset_attributes?
      data.present? && data_changed?
    end


    protected

    def update_asset_attributes
      self.content_type = data.file.content_type
      self.file_size = data.file.size
    end
  end
end
