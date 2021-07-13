# AddressLineDivider

The purpose of this GEM is to provide a tool to correctly parse address lines into Street + Street Number. Sometimes it's trivial and it can be solved with a regular expression, but when the street itself contains numbers, the task needs some extra considerations.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'address_line_divider'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install address_line_divider

## Usage
The implementation is rather simple: you can provide a path to a file where the not-so-obvious street names are. Then, when trying to divide an address line, the algorithm will check if the given input can be found in the file. If not, it will try to parse it using a Regex.

If any match, it returns an array: `[street, street_no]`. If no match, it returns `nil`.
### Configuration
This app uses a plain text file containing street names. If no file path is provided, it will just use the implemented Regex (may not work for all cases).
The path to the file is set using a configuration object as follow:
```ruby
AddressLineDivider.configure do |config|
    config.streets_file_path = "path/to/file"
end
```

### Where to get a file with street names
Depending on your location, there are different providers of street names. This gem does not implement (yet) any mechanism to get nor to normalize them.
Some good providers:
- [OpenStreetMap.org](https://download.geofabrik.de/). For Germany, also see: https://www.zeit.de/interactive/strassennamen/
- https://www.dhl-geschaeftskundenportal.de/ (Paid and only for Germany)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/address_line_divider. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/address_line_divider/blob/master/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the AddressLineDivider project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/address_line_divider/blob/master/CODE_OF_CONDUCT.md).
