$LOAD_PATH << File.expand_path('../lib', __FILE__)
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

  s.files         = Dir['lib/**/*.rb'] +
                    Dir['grammar/**']
  s.executables   = ['propose']
  s.require_paths = ['lib']

  s.required_ruby_version = '~> 2.0'

  s.add_dependency 'colorize', '~> 0.7'
  s.add_dependency 'terminal-table', '~> 1.4'
  s.add_dependency 'treetop', '~> 1.5.0'

  s.add_development_dependency 'overcommit', '0.23.0' # Pin for Travis builds
  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'rspec-its', '~> 1.0'
  s.add_development_dependency 'rubocop', '0.29.1' # Pin for Travis builds
  s.add_development_dependency 'travis', '~> 1.7'
end
