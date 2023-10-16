lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pubnub/version'

Gem::Specification.new do |spec|
  spec.name = 'pubnub'
  spec.version = Pubnub::VERSION
  spec.authors = ['PubNub']
  spec.email = ['support@pubnub.com']
  spec.summary = 'PubNub Official Ruby gem.'
  spec.description = 'Ruby anywhere in the world in 250ms with PubNub!'
  spec.homepage = 'https://github.com/pubnub/ruby'
  spec.licenses = %w[MIT LicenseRef-LICENSE]

  spec.files = `git ls-files -z`.split("\x0").grep_v(/^(test|spec|fixtures)/)
  spec.executables = spec.files.grep(%r{^bin\/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)\/})
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.4'

  spec.add_dependency 'addressable', '>= 2.0.0'
  spec.add_dependency 'concurrent-ruby', '~> 1.1.5'
  spec.add_dependency 'concurrent-ruby-edge', '~> 0.5.0'
  spec.add_dependency 'dry-validation', '~> 1.0'
  spec.add_dependency 'httpclient', '~> 2.8', '>= 2.8.3'
  spec.add_dependency 'json', '>= 2.2.0', '< 3'
  spec.add_dependency 'timers', '>= 4.3.0'
end
