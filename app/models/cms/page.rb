module Cms
  class Page < Content
    include UniqueCode
    has_one :menu_entry, as: :target
    has_many :launches, as: :target, :inverse_of => :target, :class_name => 'Cms::Launch'
    has_many :references, as: :target, :inverse_of => :target, :class_name => 'Cms::PageBlock'

    has_many :page_assets, as: :assetable, dependent: :destroy #, :class_name => 'Cms::PageAsset'
    accepts_nested_attributes_for :page_assets, :reject_if => :all_blank, :allow_destroy => true

    has_many :page_blocks, dependent: :destroy, :foreign_key => :content_id #, :class_name => 'Cms::PageBlock'
    accepts_nested_attributes_for :page_blocks, :reject_if => :all_blank, :allow_destroy => true

    has_many :page_documents, as: :documentable, dependent: :destroy
    accepts_nested_attributes_for :page_documents, :reject_if => :all_blank, :allow_destroy => true

    mount_uploader :image, ImageUploader

    belongs_to :section, :foreign_key => :section_id #, :class_name => 'Cms::Section'

    class << self

      def visible_fields
        (super - [:category_id, :category, :section_id] + [ :page_blocks, :page_assets, :page_documents])
      end

      def language_enum
        I18n.available_locales.collect{|l| [I18n.t("languages.#{l}"),l]}
      end
    end

  end
end
