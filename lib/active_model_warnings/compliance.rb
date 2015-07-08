module ActiveModelWarnings
  module Compliance

    def compliant?
      valid? && warnings.empty?
    end

    def warnings
      @warnings ||= ActiveModel::Errors.new(self)
    end
  end
end
