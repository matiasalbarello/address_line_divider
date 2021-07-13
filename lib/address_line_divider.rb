# frozen_string_literal: true

require_relative "address_line_divider/address_parser"
require_relative "address_line_divider/configuration"
require_relative "address_line_divider/version"

module AddressLineDivider
  class Error < StandardError; end

  class << self
    def configuration
      @configuration ||= Configuration
    end

    def configure
      yield configuration
    end
  end
end
