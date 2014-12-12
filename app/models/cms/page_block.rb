module Cms
  class PageBlock < Block

    belongs_to :page, :foreign_key => :content_id
    belongs_to :target, :polymorphic => true

    has_many :page_block_assets, as: :assetable, dependent: :destroy
    accepts_nested_attributes_for :page_block_assets, :reject_if => :all_blank, :allow_destroy => true

    has_many :documents, as: :documentable, dependent: :destroy, :class_name => 'Cms::Document'
    accepts_nested_attributes_for :documents, :reject_if => :all_blank, :allow_destroy => true

    class << self
      def block_types_enum
        Global.cms_config[:blocks][:page_block_types].collect{|key, pars| [key, I18n.t(pars[:i18k], default: pars[:default])]}
      end

      #extra fields stuff
      def extra_fields_config
        {
          icon: :string
        }
      end

      # extra fields associated enum
      def icon_enum
        []
      end
    end

  end
end
