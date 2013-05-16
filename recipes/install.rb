# XXX
#gem_package "panoptimon" do
#  action :install
#end

bash "clone_panoptimon" do
  user "root"
  cwd "/tmp"
  code <<-EOH
  (git clone git@github.com:synthesist/panoptimon.git #{node['panoptimon']['install_dir']})
  EOH
  not_if {::File.exists?("/opt/panoptimon/bin/panoptimon")}
end
# XXX
