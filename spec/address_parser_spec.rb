# frozen_string_literal: true

RSpec.describe AddressLineDivider::AddressParser do
  let(:parser) { described_class.new }

  describe "parse using regex" do
    it "divide into street and street_no" do
      allow(parser).to receive(:search_street_on_file).and_return(false)
      expect(parser.parse("test 123")).to eq %w[test 123]
    end
  end

  describe "parse using file" do
    before do
      AddressLineDivider.configure do |config|
        config.streets_file_path = "spec/test_streets.txt"
      end
    end

    it "divide into street and street_no" do
      # File Content:
      # 1st street
      # Street 2 with number
      # Test Street
      # Street
      allow(parser).to receive(:parse_using_regex).and_call_original
      expect(parser.parse("1st street 123")).to eq ["1st street", "123"]
      expect(parser.parse("Street 2 with number 123a")).to eq ["Street 2 with number", "123a"]
      expect(parser.parse("Test Street 123/124")).to eq ["Test Street", "123/124"]
      expect(parser.parse("Street 123")).to eq %w[Street 123]
      expect(parser).not_to have_received(:parse_using_regex)
    end

    it "uses the regex if the street is not found in the file" do
      allow(parser).to receive(:parse_using_regex)
      parser.parse("Not found street 123")

      expect(parser).to have_received(:parse_using_regex)
    end
  end
end
