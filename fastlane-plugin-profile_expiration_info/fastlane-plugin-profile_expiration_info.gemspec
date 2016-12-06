# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/profile_expiration_info/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-profile_expiration_info'
  spec.version       = Fastlane::ProfileExpirationInfo::VERSION
  spec.author        = %q{Steven Chung}
  spec.email         = %q{schung7@vt.edu}

  spec.summary       = %q{Returns if the provisioning profile has expired and the DateTime it expires}
  spec.homepage      = "https://github.com/schung7/fastlane-plugin-profile_expiration_info"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  # spec.add_dependency 'your-dependency', '~> 1.0.0'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'fastlane', '>= 1.107.0'
end
