# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hammer_cli_foreman_salt/version'

Gem::Specification.new do |s|
  s.name          = 'hammer_cli_foreman_salt'
  s.version       = HammerCLIForemanSalt.version.dup
  s.platform      = Gem::Platform::RUBY
  s.authors       = ['Stephen Benjamin']
  s.email         = 'stephen@redhat.com'
  s.homepage      = 'http://github.com/theforeman/hammer_cli_foreman_salt'
  s.license       = 'GPL-3.0'

  s.summary       = 'Foreman Salt-related commands for Hammer CLI'

  s.files            = Dir['{config,lib,locale}/**/*', 'README*']
  s.extra_rdoc_files = Dir['README*']
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 2.5'

  s.add_dependency 'hammer_cli_foreman', '>= 2.0.0', '< 4.0.0'
  s.add_development_dependency 'theforeman-rubocop', '~> 0.1.0'
end
