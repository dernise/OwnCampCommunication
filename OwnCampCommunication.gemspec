# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'OwnCampCommunication/version'

Gem::Specification.new do |spec|
  spec.name          = "OwnCampCommunication"
  spec.version       = OwnCampCommunication::VERSION
  spec.authors       = ["Maxence Henneron"]
  spec.email         = ["dernise@live.fr"]
  spec.description   = 'Provide a gem to communicate with OwnCamp\'s Daemon'
  spec.summary       = ''
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
