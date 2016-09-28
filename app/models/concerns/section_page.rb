module SectionPage
  extend ActiveSupport::Concern

  included do

    class << self
      def extra_fields_config
        super.merge({
          section_landing_page: :boolean
        })
      end

      def visible_field
        super - [:section_id]
      end
    end


    ## Landing logic
    # Verify that only one page can be set ad landing page for a specific section
    after_save :check_section
    scope :landing_for_section, ->{where("(cms_contents.extra_fields LIKE ?) OR (cms_contents.extra_fields LIKE ?)","%section_landing_page: '1'%","%section_landing_page: true%")}

    protected

    def check_section
      unless self.section
        self.section_landing_page = false
      else
        if self.section_landing_page
          #unset previous new opening records
          k = self.class
          shops = k.landing_for_section(k.name.to_s.underscore)
          shops.each do |s|
            s.section_landing_page = false
            s.save
          end
        end
      end
    end

  end
end
