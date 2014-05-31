# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = 'pubnub'
  s.version = '3.6.3'

  s.required_rubygems_version = Gem::Requirement.new('>= 0') if s.respond_to? :required_rubygems_version=
  s.authors = ['PubNub']
  s.date = '2014-05-31'
  s.description = 'Ruby anywhere in the world in 250ms with PubNub!'
  s.email = 'support@pubnub.com'
  s.files = `git ls-files`.split("\n")
  s.homepage = 'http://github.com/pubnub/ruby'
  s.licenses = ['MIT']
  s.require_paths = ['lib']
  s.rubygems_version = '1.7.2'
  s.summary = 'PubNub Official Ruby gem'

  s.add_dependency 'eventmachine'
  s.add_dependency 'net-http-persistent'
  s.add_dependency 'json'

end
