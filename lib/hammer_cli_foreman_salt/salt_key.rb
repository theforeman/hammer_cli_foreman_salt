require 'hammer_cli'
require 'hammer_cli_foreman'

module HammerCLIForemanSalt
  class SaltKey < HammerCLIForeman::Command
    resource :salt_keys

    class ListCommand < HammerCLIForeman::ListCommand
      output do
        field :name, _('Name')
        field :fingerprint, _('Fingerprint')
        field :state, _('State')
      end

      build_options
    end

    class UpdateCommand < HammerCLIForeman::UpdateCommand
      build_options
    end

    class DeleteCommand < HammerCLIForeman::DeleteCommand
      success_message _('Salt key deleted')
      failure_message _('Could not delete the Salt key')

      build_options
    end

    autoload_subcommands
  end

  HammerCLI::MainCommand.subcommand 'salt-key', 'Manage Salt keys', SaltKey
end
