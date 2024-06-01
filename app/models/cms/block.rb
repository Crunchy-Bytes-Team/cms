module Cms
  class Block < ApplicationRecord
    include Visibility
    include SerializedFields
    #include NestedSerialization

    translates :title, :subtitle, :abstract, :description

    def cleaned_anchor_name
      anchor_name.blank? ? "" : anchor_name.gsub("#","")
    end

    after_initialize do
      if new_record?
        self.target_mode = 'Free'
      end
    end

    class << self
      def visible_fields
        ([:block_type] + new.attributes.keys.collect{|k| k.to_sym}.concat(extra_fields_config.keys - [:block_type]) - [:id, :created_at, :updated_at, :type, :extra_fields])
      end

      def block_types_enum
        []
      end

      def icon_enum
        []
      end

      # def inherited(subclass)
      #   subclass.extra_fields_config.each do |k,v|
      #     logger.info "Defining #{k}="
      #     define_method "#{k}=" do |val|
      #       subclass.extra_fields[k.to_sym] = val
      #     end
      #   end
      # end

    end



  end
end
