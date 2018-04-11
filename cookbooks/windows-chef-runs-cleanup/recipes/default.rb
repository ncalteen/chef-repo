#
# Cookbook:: windows-chef-runs-cleanup
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

if File.exist?(node["aws_opsworks_system"]["cleanup"]["customer_run_dir"])
  files = Dir.glob(File.join(node["aws_opsworks_system"]["cleanup"]["customer_run_dir"], "*")).sort_by { |c| File.stat(c).ctime }
  files_to_delete = files[0, files.size - node["aws_opsworks_system"]["cleanup"]["keep_logs"]] || []

  log("Cleaning up #{files_to_delete.size} from #{node["aws_opsworks_system"]["cleanup"]["customer_run_dir"]}")

  files_to_delete.each do |afile|
    directory afile do
      recursive true
      action :delete
    end
  end
end
