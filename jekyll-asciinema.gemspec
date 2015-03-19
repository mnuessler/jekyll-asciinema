# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll/asciinema/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-asciinema"
  spec.version       = Jekyll::Asciinema::VERSION
  spec.authors       = ["Matthias Nüßler"]
  spec.email         = ["m.nuessler@web.de"]

  spec.summary       = %q{Liquid tag for embedding asciicasts in Jekyll sites.}
  spec.description   =
    %q{Provides a Liquid tag for embedding asciicasts recorded with asciinema for use in Jekyll sites.}
  spec.homepage      = "https://github.com/mnuessler/jekyll-asciinema"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "jekyll", "~> 2.0"
end
