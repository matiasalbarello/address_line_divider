# frozen_string_literal: true

module AddressLineDivider
  class AddressParser
    def initialize
      @path = AddressLineDivider.configuration.streets_file_path
    end

    def parse(address_line)
      street = search_street_on_file(address_line)
      return [street, street_no(address_line, street)] if street

      parse_using_regex(address_line)
    end

    private

    def parse_using_regex(address_line)
      /^(?<street>\D+) (?<street_no>.*)/ =~ address_line
      [street, street_no]
    end

    def search_street_on_file(address_line)
      return false if @path.nil?

      IO.foreach(@path) do |street_name|
        street_name.chop!
        return street_name if Regexp.new(/^#{street_name}/).match?(address_line)
      end

      false
    end

    def street_no(address_line, street)
      address_line.gsub(street, "").strip
    end
  end
end