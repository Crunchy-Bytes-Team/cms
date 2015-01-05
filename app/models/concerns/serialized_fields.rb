module SerializedFields
  extend ActiveSupport::Concern

  included do

    after_initialize :add_store_accessors

    store :extra_fields

    def custom_rails_admin_translated_fields
      self.class.extra_fields_config.keys
    end

    #override in any subclass
    class << self
      def extra_fields_config
        {}
      end

      def rails_admin_config(config)
        klass = name.constantize
        klass.visible_fields.each do |field_name|
          unless klass.extra_fields_config[field_name.to_sym].nil?
            if klass.respond_to? "#{field_name}_enum"
              config.field field_name,  :enum do
                enum do
                  klass.send("#{field_name}_enum")
                end
              end
            elsif klass.extra_fields_config[field_name.to_sym].to_s == 'text'
              config.field field_name, klass.extra_fields_config[field_name.to_sym], :ck_editor
            else
              config.field field_name, klass.extra_fields_config[field_name.to_sym] #field type for serialized fields
            end
          else
            config.field field_name, (:ck_editor if [:description].include? field_name)
          end
        end
      end

      def visible_fields
        (new.attributes.keys.collect{|k| k.to_sym}.concat(extra_fields_config.keys) - [:id, :created_at, :updated_at, :type, :slug, :extra_fields])
      end
    end

    def add_store_accessors
      self.class.extra_fields_config.each do |field_name, field_type|
        singleton_class.class_eval {store_accessor :extra_fields, field_name}
      end unless self.class.extra_fields_config.blank?
    end

  end
end
