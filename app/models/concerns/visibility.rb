module Visibility
  extend ActiveSupport::Concern

  included do
    scope :published, -> { where(published: true) }
    scope :ordered, -> { order("#{self.to_s.gsub('Cms::','cms_').tableize}.position ASC") }
    default_scope { ordered }
  end
end
