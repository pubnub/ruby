# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = 'pubnub'
  s.version = '3.4beta'

  s.required_rubygems_version = Gem::Requirement.new('>= 0') if s.respond_to? :required_rubygems_version=
  s.authors = ['PubNub']
  s.date = '2013-02-14'
  s.description = 'Ruby anywhere in the world in 250ms with PubNub!'
  s.email = 'support@pubnub.com'
  s.files = `git ls-files`.split('\n')
  s.homepage = 'http://github.com/pubnub/pubnub-api'
  s.licenses = ['MIT']
  s.require_paths = ['lib']
  s.rubygems_version = '1.7.2'
  s.summary = 'PubNub Official Ruby gem'

  s.add_dependency 'activesupport'
  s.add_dependency 'eventmachine'
  s.add_dependency 'persistent_httparty'
  s.add_dependency 'httparty'
  s.add_dependency 'em-http-request'
  s.add_dependency 'uuid', '~> 2.3.5'
  s.add_dependency 'yajl-ruby'
  s.add_dependency 'json'

end
