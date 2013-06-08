# XXX Testing new fireamp-pan package via base::install_fire 
#  panoptimon

%w{
  rusage
}.each do |gem|
  gem_package gem do
    gem_binary("/opt/fire/embedded/bin/gem")
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
