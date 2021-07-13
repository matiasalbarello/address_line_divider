# frozen_string_literal: true

require_relative "address_line_divider/version"
require_relative "address_line_divider/configuration.rb"

module AddressLineDivider
  class Error < StandardError; end

  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield configuration
    end
  end
end
