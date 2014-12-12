module Cms
  class Block < ActiveRecord::Base
    include Visibility
    include SerializedFields

    translates :title, :subtitle, :abstract, :description

    def cleaned_anchor_name
      anchor_name.blank? ? "" : anchor_name.gsub("#","")
    end

    class << self
      def visible_fields
        (extra_fields_config.keys.concat(new.attributes.keys.collect{|k| k.to_sym}) - [:id, :created_at, :updated_at, :type, :extra_fields])
      end

      def block_types_enum
        []
      end

      def icon_enum
        []
      end
    end

  end
end
