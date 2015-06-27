module UniqueCode
  extend ActiveSupport::Concern

  included do
    before_validation :generate_code

    def generate_code
      if self.code.blank?
        self.code = self.generate_unique_code
      end
    end

    class << self
      def codes
        @codes ||= pluck(:code).compact
      end
      def code_attribute
        :title
      end
    end


    def generate_unique_code
      _code = self.title.parameterize
      _i = 1
      while self.class.codes.include? _code
        _code = self.try(self.class.code_attribute).parameterize + "-#{_i}"
        _i += 1
      end
      _code
    end
  end
end


