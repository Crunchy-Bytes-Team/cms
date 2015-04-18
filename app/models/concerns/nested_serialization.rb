module NestedSerialization
  extend ActiveSupport::Concern

  included do

    def self.inherited(subclass)
      binding.pry
      unless subclass.try(:extra_fields).nil?
        logger.info "Defining setters for #{subclass}"
        subclass.extra_fields_config.each do |k,v|
          logger.info "Defining #{k}="
          define_method "#{k}=" do |val|
            subclass.extra_fields[k.to_sym] = val
          end
        end
      end
    end

  end
end
