# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pubnub/version'

Gem::Specification.new do |spec|
  spec.name            = 'pubnub'
  spec.version         = Pubnub::VERSION
  spec.authors         = ['PubNub']
  spec.email           = ['support@pubnub.com']
  spec.summary         = 'PubNub Official Ruby gem.'
  spec.description     = 'Ruby anywhere in the world in 250ms with PubNub!'
  spec.homepage        = 'http://github.com/pubnub/ruby'
  spec.license         = 'MIT'

  spec.files           = `git ls-files -z`.split("\x0")
  spec.executables     = spec.files.grep(%r{^bin\/}) { |f| File.basename(f) }
  spec.test_files      = spec.files.grep(%r{^(test|spec|features)\/})
  spec.require_paths   = ['lib']

  spec.add_dependency 'celluloid',           '~> 0.17'
  spec.add_dependency 'concurrent-ruby',     '~> 1.0.5'
  spec.add_dependency 'concurrent-ruby-edge','~> 0.31'
  spec.add_dependency 'json',                '>= 1.8', '< 3'
  spec.add_dependency 'httpclient',          '~> 2.8', '>= 2.8.3'
  spec.add_dependency 'dry-validation',      '~> 0.10'
  spec.add_development_dependency 'bundler', '~> 1.7'
end
