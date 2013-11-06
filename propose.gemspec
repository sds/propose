$:.push File.expand_path('../lib', __FILE__)
require 'propose/version'

Gem::Specification.new do |s|
  s.name        = 'propose'
  s.version     = Propose::VERSION
  s.license     = 'MIT'
  s.platform    = Gem::Platform::RUBY
  s.author      = 'Shane da Silva'
  s.email       = 'shane@dasilva.io'
  s.homepage    = 'https://github.com/sds/propose'
  s.summary     = 'Propositional logic sentence playground'
  s.description = 'Create, manipulate, and verify propositional logic sentences'

  s.files         = Dir['lib/**/*.rb']
  s.files         = Dir['grammar/**/*.rb']
  #s.executables   = ['propose']
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 1.9.3'

  s.add_dependency 'colorize'
  s.add_dependency 'treetop'

  s.add_development_dependency 'rspec'
end
