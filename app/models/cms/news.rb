module Cms
  class News < ActiveRecord::Base
    include Visibility
    extend FriendlyId

    NEWS_TYPE = %w(news eventi rassegna-stampa)

    translates :title, :subtitle, :slug, :abstract, :description
    friendly_id :title, use: [:slugged, :globalize]

    scope :sorted, -> {order("date DESC")}
    mount_uploader :image, ImageUploader

    has_many :news_assets, as: :assetable, dependent: :destroy, :class_name => 'Cms::NewsAsset'
    accepts_nested_attributes_for :news_assets, :reject_if => :all_blank, :allow_destroy => true

    has_one :document, as: :documentable, dependent: :destroy
    accepts_nested_attributes_for :document, :reject_if => :all_blank, :allow_destroy => true

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
