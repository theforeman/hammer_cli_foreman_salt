# frozen_string_literal: true

require 'hammer_cli'
require 'hammer_cli_foreman'

module HammerCLIForemanSalt
  class SaltVariable < HammerCLIForeman::Command
    resource :salt_variables

    class ListCommand < HammerCLIForeman::ListCommand
      output do
        field :id, _('ID')
        field :variable, _('Name')
      end

      build_options
    end

    class InfoCommand < HammerCLIForeman::InfoCommand
      output do
        field :id, _('ID')
        field :variable, _('Name')
        field :default_value, _('Default Value')
        field :override_values, _('Override Values')
        field :hidden_value?, _('Hidden Value?')
        field :description, _('Description')
      end

      build_options
    end

    class CreateCommand < HammerCLIForeman::CreateCommand
      success_message _('Salt Variable created')
      failure_message _('Could not create the Salt Variable')

      build_options
    end

    class DeleteCommand < HammerCLIForeman::DeleteCommand
      success_message _('Salt Variable deleted')
      failure_message _('Could not delete the Salt Variable')

      build_options
    end

    class UpdateCommand < HammerCLIForeman::UpdateCommand
      success_message _('Salt Variable updated')
      failure_message _('Could not update the Salt Variable')

      # remove --new-* commands
      def self.create_option_builder
        builder = super
        builder.builders.delete_if { |b| b.instance_of?(HammerCLIForeman::SearchablesUpdateOptionBuilder) }
        builder
      end

      build_options
    end

    autoload_subcommands
  end

  HammerCLI::MainCommand.subcommand 'salt-variable', 'Manage Salt Variables', SaltVariable
end
