module Cms
  class Content < ActiveRecord::Base
    include Visibility
    include SerializedFields
    extend FriendlyId

    scope :highlighted, -> {where(highlight: true)}
    
    translates :title, :slug, :abstract, :description
    friendly_id :title, use: [:slugged, :globalize]

    validates :code,
      uniqueness: true,
      allow_blank: false,
      presence: true,
      length: {
        minimum: 3
      },
      format: {
        :with => /\A[a-zA-Z0-9\_\.\-]+\z/,
        :message => "non può contenere numeri o spazi"
      },
      if: Proc.new{ self.class.code_required}



    validates :title,
      presence: true,
      allow_blank: false,
      uniqueness: true,
      length: {maximum: 250}

    validates_uniqueness_of :slug

    class << self

      def visible_fields
        (extra_fields_config.keys.concat(new.attributes.keys.collect{|k| k.to_sym}) - [:id, :created_at, :updated_at, :type, :slug, :extra_fields, :content_id])
      end

      def code_required
        true
      end
    end
  end
end
