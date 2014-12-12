module Visibility
  extend ActiveSupport::Concern

  included do
    scope :published, -> { where(published: true) }
    default_scope {order("#{self.to_s.gsub('Cms::','cms_').tableize}.position ASC")}
  end
end
