directory node['panoptimon']['conf_dir'] do
  owner "root"
  group "root"
  mode 0755
end

# XXX Writing the configs out like this means they will get written out every
# XXX run. Which is likely awful.
ruby_block "generate_pan_config" do
  block do
    File.open("#{node['panoptimon']['conf_dir']}/panoptimon.json","w") do |f|
      f.write(JSON.pretty_generate(node['panoptimon']['config']))
    end
  end
end

%w[collectors plugins].each do |dir|
  directory "#{node['panoptimon']['conf_dir']}/#{dir}" do
    owner     node['panoptimon']['user']
    group     node['panoptimon']['group']
    mode      0755
  end
end

node['panoptimon']['plugins'].each do |plugin|
  log "Enabling panoptimon #{plugin}."
  link "#{node['panoptimon']['conf_dir']}/plugins/#{plugin}" do
    to "#{node['panoptimon']['install_dir']}/plugins/#{plugin}"
  end

  ruby_block "generate #{plugin} config" do
    block do 
      File.open("#{node['panoptimon']['conf_dir']}/plugins/#{plugin}.json","w") do |f|
        f.write(JSON.pretty_generate(node['panoptimon']['plugin'][plugin]))
      end
    end
  end
end
