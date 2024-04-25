# frozen_string_literal: true

require 'hammer_cli'
require 'hammer_cli_foreman'

module HammerCLIForemanSalt
  class SaltHostgroup < HammerCLIForeman::Command
    resource :salt_hostgroups

    class InfoCommand < HammerCLIForeman::InfoCommand
      output do
        field :id, _('ID')
        field :name, _('Name')
        field :salt_master, _('Salt Master')
        field :salt_environment, _('Salt Environment')
        field :salt_states, _('Salt States')
      end

      # remove --name command
      def self.create_option_builder
        builder = super
        builder.builders.delete_if { |b| b.instance_of?(HammerCLIForeman::SearchablesOptionBuilder) }
        builder
      end

      build_options
    end

    class UpdateCommand < HammerCLIForeman::UpdateCommand
      success_message _('Salt Hostgroup updated')
      failure_message _('Could not update the Salt Hostgroup')

      # remove --new-* and --name commands
      def self.create_option_builder
        builder = super
        builder.builders.delete_if { |b| b.instance_of?(HammerCLIForeman::SearchablesUpdateOptionBuilder) }
        builder.builders.delete_if { |b| b.instance_of?(HammerCLIForeman::SearchablesOptionBuilder) }
        builder
      end

      build_options
    end

    autoload_subcommands
  end

  HammerCLI::MainCommand.subcommand 'salt-hostgroup', 'Manage Salt Hostgroups', SaltHostgroup
end
