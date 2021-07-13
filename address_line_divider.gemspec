# frozen_string_literal: true

require_relative "lib/address_line_divider/version"

Gem::Specification.new do |spec|
  spec.name          = "address_line_divider"
  spec.version       = AddressLineDivider::VERSION
  spec.authors       = ["Matias Albarello"]
  spec.email         = ["matias.albarello@gmail.com"]
  spec.licenses      = ["MIT"]

  spec.summary       = "Divide an address line into street and street number based on a Streets file."
  spec.homepage      = "https://github.com/matiasalbarello/address_line_divider"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/master/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
