# frozen_string_literal: true

module AddressLineDivider
  class Configuration
    class FileNotFound < StandardError; end

    attr_reader :streets_file_path

    def streets_file_path=(path)
      return if path.nil?

      raise FileNotFound, "Couldn't find a file with the path `#{path}`." unless File.exist? path
      @streets_file_path = path
    end
  end
end