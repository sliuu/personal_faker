# PersonalFaker

This gem allows you to create fake sentences, questions, etc based on
a famous text of your choosing.

On initialization, a table is created that matches each word in the text with the frequencies of words that come after it. The algorithm then loops through one word at a time, picking randomnly a word that comes after it in the text. If no word comes after it (i.e. the end of the text is reached, a random word from the text is chosen).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'personal_faker'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install personal_faker

## Usage

Initialize the faker with your chosen text

```ruby
my_faker = PersonalFaker::Base.new('macbeth')
```

Then you can create sentences that are based on the text

```ruby
title = my_faker.sentence
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sliuu/personal_faker. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

