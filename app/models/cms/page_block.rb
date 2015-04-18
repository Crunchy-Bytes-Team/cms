module Cms
  class PageBlock < Block

    belongs_to :page, :foreign_key => :content_id, :class_name => 'Cms::Page'
    belongs_to :target, :polymorphic => true

    has_many :page_block_assets, as: :assetable, dependent: :destroy
    accepts_nested_attributes_for :page_block_assets, :reject_if => :all_blank, :allow_destroy => true

    has_many :documents, as: :documentable, dependent: :destroy #, :class_name => 'Cms::Document'
    accepts_nested_attributes_for :documents, :reject_if => :all_blank, :allow_destroy => true

    class << self
      def block_type_enum
        Global.cms_config[:blocks][:page_block_types].collect{|key, pars| [I18n.t(pars[:i18n], default: pars[:default]), key]}
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

    extra_fields_config.each do |k,v|
      logger.info "Defining #{k}="
      define_method "#{k}=" do |val|
        extra_fields[k.to_sym] = val
      end
    end

  end
end
