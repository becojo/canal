# Canal

[![Gem Version](https://badge.fury.io/rb/canal.svg)](https://badge.fury.io/rb/canal)

Canal is an utility that builds callable objects out of a chain of method calls. It can be used to write simpler and shorter code that avoids using blocks or lambdas.

## Usage

Include the `canal` gem and expose the `canal` method:

```ruby
require 'canal'
```

### Using canals instead of lambdas

```ruby
lambda { |x| x.to_s(2) }
canal.to_s(2)
```

### Using canals instead of blocks

```ruby
[1, 2, 3].map { |value| value + 1 }
[1, 2, 3].map(&canal + 1)
```

```ruby
[1, 2, 3].select { |value| value > 1 }
[1, 2, 3].select(&canal > 1)
```

### Using hashes

```ruby
people = [{ name: "Alice" }, { name: "Bob" }]
people.map(&canal[:name])
=> ["Alice", "Bob"]
```

### Nesting canals

```ruby
# Format a 2D array into a grid
rows = [[1, 2], [31, 4]]
puts rows.map(&canal.map(&canal.to_s.ljust(3, ' ')).join).join("\n")
1  2
31 4
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
