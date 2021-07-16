# frozen_string_literal: true

module AddressLineDivider
  class AddressParser
    def initialize
      @path = AddressLineDivider.configuration.streets_file_path
    end

    def parse(address_line)
      street = search_street_on_file(address_line)
      return [street, street_no(address_line, street)] if street

      result = parse_using_regex(address_line)
      result unless result.nil? || result.any?(:nil?)
    end

    private

    def parse_using_regex(address_line)
      last_number = last_number(address_line)
      return unless last_number

      last_number_index = address_line.index(last_number)
      street_name = address_line[0..last_number_index - 1].strip
      street_no = address_line[last_number_index..-1].strip

      [street_name, street_no]
    end

    def last_number(address_line)
      squish(address_line).split(" ").select do |substr|
        substr =~ /[[:digit:]]/
      end.last
    end

    def squish(string)
      string.gsub("  ", " ").strip
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
