# frozen_string_literal: true

require 'hammer_cli'
require 'hammer_cli_foreman'

module HammerCLIForemanSalt
  class SaltEnvironment < HammerCLIForeman::Command
    resource :salt_environments

    class ListCommand < HammerCLIForeman::ListCommand
      output do
        field :id, _('ID')
        field :name, _('Name')
      end

      build_options
    end

    class InfoCommand < HammerCLIForeman::InfoCommand
      output SaltEnvironment::ListCommand.output_definition do
        HammerCLIForeman::References.timestamps(self)
      end

      build_options
    end

    class CreateCommand < HammerCLIForeman::CreateCommand
      success_message _('Salt Environment created')
      failure_message _('Could not create the Salt Environment')

      build_options
    end

    class DeleteCommand < HammerCLIForeman::DeleteCommand
      success_message _('Salt Environment deleted')
      failure_message _('Could not delete the Salt Environment')

      build_options
    end

    autoload_subcommands
  end

  HammerCLI::MainCommand.subcommand 'salt-environment', 'Manage Salt Environments', SaltEnvironment
end
