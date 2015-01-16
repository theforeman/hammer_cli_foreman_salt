require File.expand_path('../lib/hammer_cli_foreman_salt/version', __FILE__)

Gem::Specification.new do |s|
  s.name          = 'hammer_cli_foreman_salt'
  s.version       = HammerCLIForemanSalt.version.dup
  s.platform      = Gem::Platform::RUBY
  s.authors       = ['Stephen Benjamin']
  s.email         = 'stephen@redhat.com'
  s.homepage      = 'http://github.com/theforeman/hammer_cli_foreman_salt'
  s.license       = 'GPL v3+'

  s.summary       = 'Foreman Salt-related commands for Hammer'
  s.description   = 'Foreman Salt-related commands for Hammer CLI'

  s.files            = Dir['{config,lib,locale}/**/*', 'README*']
  s.extra_rdoc_files = Dir['README*']
  s.require_paths = ['lib']

  s.add_dependency 'hammer_cli_foreman', '>= 0.1.2'

end
