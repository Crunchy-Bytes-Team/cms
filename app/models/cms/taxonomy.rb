module Cms
  class Taxonomy < ApplicationRecord
    include Visibility

    translates :name

    validates :name,
      presence: true,
      allow_blank: false,
      length: {minimum: 3, maximum: 250}

    #uniqueness: true, <- in subclasses ?
  end
end
