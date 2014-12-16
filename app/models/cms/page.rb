module Cms
  class Page < Content

    has_one :menu_entry, as: :target

    has_many :references, as: :target, :inverse_of => :target, :class_name => 'Cms::PageBlock'

    has_many :page_assets, as: :assetable, dependent: :destroy #, :class_name => 'Cms::PageAsset'
    accepts_nested_attributes_for :page_assets, :reject_if => :all_blank, :allow_destroy => true

    has_many :page_blocks, dependent: :destroy, :foreign_key => :content_id #, :class_name => 'Cms::PageBlock'
    accepts_nested_attributes_for :page_blocks, :reject_if => :all_blank, :allow_destroy => true

    mount_uploader :image, ImageUploader

    belongs_to :section, :foreign_key => :section_id #, :class_name => 'Cms::Section'

    class << self
      def visible_fields
        (super - [:section_id] + [:section, :page_blocks, :page_assets])
      end
    end
  end
end