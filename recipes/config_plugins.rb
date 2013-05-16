# XXX Writing the configs out like this means they will get written out every
# XXX run. Which is likely awful.
log "PANOPTIMON: Writing panoptimon.json."
File.open("#{node['panoptimon']['conf_dir']}/panoptimon.json","w") do |f|
  f.write(JSON.pretty_generate(node['panoptimon']['config']))
end

%w[collectors plugins].each do |dir|
  directory "#{node['panoptimon']['conf_dir']}/#{dir}" do
    owner     node['panoptimon']['user']
    group     node['panoptimon']['group']
    mode      0755
  end
end

node['panoptimon']['plugins'].each do |plugin|
  log "PANOPTIMON: Enabling #{plugin}."
  link "#{node['panoptimon']['conf_dir']}/plugins/#{plugin}" do
    to "#{node['panoptimon']['install_dir']}/plugins/#{plugin}"
  end

  log "PANOPTIMON: Writing #{plugin} config from node attributes."
  File.open("#{node['panoptimon']['conf_dir']}/plugins/#{plugin}.json","w") do |f|
    f.write(JSON.pretty_generate(node['panoptimon']['plugin'][plugin]))
  end
end
