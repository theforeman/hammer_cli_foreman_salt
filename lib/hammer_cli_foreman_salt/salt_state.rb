require 'hammer_cli'
require 'hammer_cli_foreman'

module HammerCLIForemanSalt
  class SaltState < HammerCLIForeman::Command
    resource :salt_states

    class ListCommand < HammerCLIForeman::ListCommand
      output do
        field :id, _('ID')
        field :name, _('Name')
      end

      build_options
    end

    class CreateCommand < HammerCLIForeman::CreateCommand
      success_message _('Salt State created')
      failure_message _('Could not create the Salt State')

      build_options
    end

    class DeleteCommand < HammerCLIForeman::DeleteCommand
      success_message _('Salt State deleted')
      failure_message _('Could not delete the Salt State')

      build_options
    end

    autoload_subcommands
  end

  HammerCLI::MainCommand.subcommand 'salt-state', 'Manage Salt States', SaltState
end
