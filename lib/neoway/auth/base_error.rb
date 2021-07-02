# frozen_string_literal: true

module Neoway
  module Auth
    class BaseError < StandardError
      def initialize(message = self.class.default_message)
        super(message)
      end

      def self.default_message
        name = self.name.dup

        I18n.t("errors.#{underscore(name)}")
      end

      def self.underscore(str)
        str.gsub(/::/, ".")
           .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
           .gsub(/([a-z\d])([A-Z])/, '\1_\2')
           .tr("-", "_")
           .downcase
      end
    end
  end
end
