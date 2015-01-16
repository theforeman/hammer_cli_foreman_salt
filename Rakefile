require 'bundler/gem_tasks'

namespace :gettext do
  desc 'Update pot file'
  task :find do
    require 'hammer_cli_foreman_bootdisk/version'
    require 'hammer_cli_foreman_bootdisk/i18n'
    require 'gettext/tools'

    domain = HammerCLIForemanBootdisk::I18n::LocaleDomain.new
    GetText.update_pofiles(domain.domain_name, domain.translated_files, "#{domain.domain_name} #{HammerCLIForemanBootdisk.version.to_s}", :po_root => domain.locale_dir)
  end
end

namespace :pkg do
  desc 'Generate package source gem'
  task :generate_source => :build
end
