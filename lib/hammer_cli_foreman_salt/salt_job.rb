# frozen_string_literal: true

require 'hammer_cli'
require 'hammer_cli_foreman'

module HammerCLIForemanSalt
  class SaltJobs < HammerCLIForeman::Command
    resource :jobs

    class UploadCommand < HammerCLIForeman::Command
      action :upload
      command_name 'upload'

      success_message _('Salt job uploaded successfully')
      failure_message _('Salt job upload failed')

      build_options
    end

    autoload_subcommands
  end

  HammerCLI::MainCommand.subcommand 'salt-jobs', 'Upload Salt Jobs', SaltJobs
end
