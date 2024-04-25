# frozen_string_literal: true

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

    class InfoCommand < HammerCLIForeman::InfoCommand
      output do
        field :id, _('ID')
        field :name, _('Name')

        collection :salt_environments, _('Salt Environments'), hide_blank: true do
          field :name, _('Name')
        end

        collection :hostgroups, _('Hostgroups'), hide_blank: true do
          field :title, _('Title')
        end
      end

      build_options
    end

    class DeleteCommand < HammerCLIForeman::DeleteCommand
      success_message _('Salt State deleted')
      failure_message _('Could not delete the Salt State')

      build_options
    end

    class ImportCommand < HammerCLIForeman::Command
      action :import

      command_name 'import'
      success_message _('States were imported')
      failure_message _('Import of states failed')

      build_options
    end

    autoload_subcommands
  end

  HammerCLI::MainCommand.subcommand 'salt-state', 'Manage Salt States', SaltState
end
