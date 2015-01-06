module Cms
  class Page < Content

    has_one :menu_entry, as: :target
    has_many :launches, as: :target, :inverse_of => :target, :class_name => 'Cms::Launch'
    has_many :references, as: :target, :inverse_of => :target, :class_name => 'Cms::PageBlock'

    has_many :page_assets, as: :assetable, dependent: :destroy #, :class_name => 'Cms::PageAsset'
    accepts_nested_attributes_for :page_assets, :reject_if => :all_blank, :allow_destroy => true

    has_many :page_blocks, dependent: :destroy, :foreign_key => :content_id #, :class_name => 'Cms::PageBlock'
    accepts_nested_attributes_for :page_blocks, :reject_if => :all_blank, :allow_destroy => true

    mount_uploader :image, ImageUploader

    belongs_to :section, :foreign_key => :section_id #, :class_name => 'Cms::Section'

    class << self
      def extra_fields_config
        {section_landing_page: :boolean}
      end

      def visible_fields
        (super - [:section_id] + [:section, :page_blocks, :page_assets])
      end
    end


    ## Landing logic
    # Verify that only one page can be set ad landing page for a specific section
    before_save :check_landing
    scope :landing_for_section, ->(section_name){joins(:section).where("cms_sections.name = ?", section_name)}

    protected

    def check_landing
      unless self.section
        self.section_landing_page = false
      else
        if self.section_landing_page
          #unset previous new opening records
          shops = self.class.landing_for_section(self.section.name)
          shops.each do |s|
            s.section_landing_page = false
            s.save
          end
        end
      end
    end
    ## // Landing logic

  end
end
