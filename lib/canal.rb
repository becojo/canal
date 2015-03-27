require "canal/version"

module Canal
  class Context
    def initialize
      @functions = []
    end

    def method_missing(name, *args, &block)
      @functions << [name, args, block]
      self
    end

    def call(object)
      @functions.reduce(object) do |object, function|
        name, args, block = function
        object.send(name, *args, &block)
      end
    end

    def to_s
      method_missing(:to_s)
    end

    def to_proc
      ->(object) { call(object) }
    end
  end
end

def canal
  Canal::Context.new
end
