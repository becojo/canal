require "canal/version"

module Canal
  class Context
    def initialize(functions=[])
      @functions = functions.freeze
    end

    def method_missing(name, *args, **kwargs, &block)
      Canal::Context.new(@functions + [[name, args, kwargs, block]])
    end

    def call(object)
      @functions.reduce(object) do |object, function|
        name, args, kwargs, block = function
        object.send(name, *args, **kwargs, &block)
      end
    end

    def to_proc
      ->(object) { call(object) }
    end

    %w{ to_s ! == <=> != === =~ !~ }.each do |method|
      define_method(method) do |*args|
        method_missing(method, *args)
      end
    end
  end
end

def canal
  Canal::Context.new
end
