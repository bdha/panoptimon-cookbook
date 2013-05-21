# XXX We should be using fireamp-panoptimon here, but it appears to be broken.

%w{
  rusage
  panoptimon
}.each do |gem|
  gem_package gem do
    action :install
  end
end

#bash "clone_panoptimon" do
#  user "root"
#  cwd "/tmp"
#  code <<-EOH
#  (git clone git@github.com:synthesist/panoptimon.git #{node['panoptimon']['install_dir']})
#  EOH
#  not_if {::File.exists?("/opt/panoptimon/bin/panoptimon")}
#end
# XXX
