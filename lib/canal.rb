require "canal/version"

module Canal
  class Context
    def initialize(functions=[])
      @functions = functions.freeze
    end

    def method_missing(name, *args, &block)
      Canal::Context.new(@functions + [[name, args, block]])
    end

    def call(object)
      @functions.reduce(object) do |object, function|
        name, args, block = function
        object.send(name, *args, &block)
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
