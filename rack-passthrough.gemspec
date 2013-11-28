# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/passthrough/version'

Gem::Specification.new do |spec|
  spec.name          = "rack-passthrough"
  spec.version       = Rack::Passthrough::VERSION
  spec.authors       = ["jo"]
  spec.email         = ["jo@smartsoftasia.com"]
  spec.description   = "Forward requests to API and forward the response back from API on a specific route"
  spec.summary       = ""
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency "httparty"
end
