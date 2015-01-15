require 'hammer_cli'
require 'hammer_cli_foreman'

module HammerCLIForemanSalt
  class SaltAutosign < HammerCLIForeman::Command
    resource :salt_autosign

    class ListCommand < HammerCLIForeman::ListCommand
      output do
        field :record, _('Autosign record')
      end

      build_options
    end

    class CreateCommand < HammerCLIForeman::CreateCommand
      success_message _('Salt autosign record created')
      failure_message _('Could not create the Salt autosign record')

      build_options
    end

    class DeleteCommand < HammerCLIForeman::DeleteCommand
      success_message _('Salt autosign record deleted')
      failure_message _('Could not delete the Salt autosign record')

      build_options
    end

    autoload_subcommands
  end

  HammerCLI::MainCommand.subcommand 'salt-autosign', 'Manage Salt key autosigning', SaltAutosign
end
