# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'canal/version'

Gem::Specification.new do |spec|
  spec.name          = "canal"
  spec.version       = Canal::VERSION
  spec.authors       = ["becojo"]
  spec.email         = ["gems@becojo.com"]
  spec.summary       = %q{Utility that builds callable objects out of a chain of method calls}
  # spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = "https://github.com/becojo/canal"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
end
