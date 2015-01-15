require 'hammer_cli'
require 'hammer_cli_foreman'

module HammerCLIForemanSalt
  class SaltMinion < HammerCLIForeman::Command
    resource :salt_minions

    class ListCommand < HammerCLIForeman::ListCommand
      output do
        field :id, _('ID')
        field :name, _('Name')
        field :salt_master, _("Salt Master")
        field :salt_environment_id, _("Salt Environment ID")
      end

      build_options
    end

    class InfoCommand < HammerCLIForeman::InfoCommand
      output do
        field :id, _('ID')
        field :name, _('Name')
        field :salt_master, _("Salt Master")
        field :salt_environment_id, _("Salt Environment ID")
        collection :salt_states, _("Salt States"), :hide_blank => true do
          field :id, _("ID")
          field :name, _("Name")
        end
      end

      build_options
    end

    class UpdateCommand < HammerCLIForeman::UpdateCommand
      build_options
    end

    autoload_subcommands
  end

  HammerCLI::MainCommand.subcommand 'salt-minion', 'Manage Salt minions', SaltMinion
end
