# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sigep_web/version'

Gem::Specification.new do |spec|
  spec.name          = 'sigep_web'
  spec.version       = SigepWeb::VERSION
  spec.authors       = ['Marcelo Perini Veloso']
  spec.email         = ['marcelo.perini.veloso@gmail.com']

  spec.summary       = %q{A gem to integrate Sigep Web API}
  spec.description   = %q{This gem provide a easy way to integrate an application to Correios Sigep Web API}
  spec.homepage      = 'https://github.com/marceloperini/sigep_web'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_rubygems_version = ">= 1.3.6"

  # Ruby 2.4 reaches EoL at the end of March of 2020
  # https://www.ruby-lang.org/en/news/2019/10/02/ruby-2-4-9-released/
  spec.required_ruby_version = ">= 2.4.0"

  spec.add_dependency 'savon', '~> 2.10'
  spec.add_dependency 'nokogiri', '>= 1.10.8'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '>= 2.0.8'
  spec.add_development_dependency 'rspec', '~> 3.9.0'
  spec.add_development_dependency 'simplecov', '~> 0.14.1'
  spec.add_development_dependency 'rubocop', '~> 0.80.0'
  spec.add_development_dependency "rubocop-performance", "~> 1.4"
  spec.add_development_dependency "rubocop-rspec", "~> 1.35"
  spec.add_development_dependency 'pry'
end
