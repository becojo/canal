# Canal

Partial application of a chain of methods.

## Examples

Canal can allow point-free expressions. For example, when using `map`:

```ruby
%w{10010101 11100 10110}.map(&canal.to_i(2).to_s.reverse.to_i.to_s(2))
```

is equivalent to

```ruby
%w{10010101 11100 10110}.map do |x|
  x.to_i(2).to_s.reverse.to_i.to_s(2)
end
```

### Identity

An empty canal is the identity function.

```ruby
[1, 2, 3].map(&canal)
=> [1, 2, 3]
```

Exemple: Count truthy values.

```ruby
[true, false, nil, "hey", 4].count(&canal)
=> 3
```

### Operators

Fetch key in list of hash.

```ruby
people = [{ name: "Alice" }, { name: "Bob" }]
people.map(&canal[:name])
=> ["Alice", "Bob"]
```

Multiply list of number by 2.

```ruby
(0..5).map(&canal * 2)
=> [0, 2, 4, 6, 8, 10]
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
