module Cms
  class News < ActiveRecord::Base
    include Visibility
    extend FriendlyId

    NEWS_TYPE = %w(news eventi rassegna-stampa)

    translates :title, :subtitle, :slug, :abstract, :description
    friendly_id :title, use: [:slugged, :globalize]

    scope :sorted, -> {order("date DESC")}
    scope :highlighted, -> {where(highlight: true)}
    scope :not_highlighted, -> {where(highlight: false)}
    scope :by_type, ->(type){
      unless type.blank?
        where(news_type: type)
      end
    }
    mount_uploader :image, ImageUploader

    has_one :menu_entry, as: :target

    has_many :news_assets, as: :assetable, dependent: :destroy
    accepts_nested_attributes_for :news_assets, :reject_if => :all_blank, :allow_destroy => true

    has_many :documents, as: :documentable, dependent: :destroy
    accepts_nested_attributes_for :documents, :reject_if => :all_blank, :allow_destroy => true

    validates_presence_of :title, allow_blank: false
    validates_uniqueness_of :slug
    validates :news_type,
      inclusion: {in: NEWS_TYPE}

    class << self
      def news_types_enum
        NEWS_TYPE.map{|n| [News.news_type_label(n), n]}
      end

      def news_type_label(n)
        I18n.t "news.filter_label.#{n}"
      end

    end

  end
end
