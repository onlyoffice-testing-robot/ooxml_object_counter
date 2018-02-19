$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'ooxml_object_counter/version'
Gem::Specification.new do |s|
  s.name = 'ooxml_object_counter'
  s.version = OoxmlObjectCounter:: VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ['ONLYOFFICE', 'Pavel Lobashov']
  s.summary = 'ONLYOFFICE Helper Gem for count objects in ooxml'
  s.description = 'ONLYOFFICE Helper Gem for count objects in ooxml. Used in QA'
  s.email = ['shockwavenn@gmail.com']
  s.files = `git ls-files lib LICENSE.txt README.md`.split($RS)
  s.homepage = 'https://github.com/onlyoffice-testing-robot/ooxml_object_counter'
  s.license = 'AGPL-3.0'
  s.add_runtime_dependency('ooxml_parser', '~> 0.3')
end
