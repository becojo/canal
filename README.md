# Canal

Canal is a Ruby library that allows the transformation of chained method calls into point-free expressions.

## Example

```ruby
%w{10010101 11100 10110}.map(&canal.to_i(2).to_s.reverse.to_i.to_s(2))
```

```ruby
%w{10010101 11100 10110}.map do |x|
  x.to_i(2).to_s.reverse.to_i.to_s(2)
end
```

## Installation

Add this line to your application's Gemfile:

    gem 'canal'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install canal

## Contributing

1. Fork it ( http://github.com/becojo/canal/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
