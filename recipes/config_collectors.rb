node['panoptimon']['collectors'].each do |collector|
  log "PANOPTIMON: Enabling #{collector}."
  link "#{node['panoptimon']['conf_dir']}/collectors/#{collector}" do
    to "#{node['panoptimon']['install_dir']}/collectors/#{collector}"
  end

  log "PANOPTIMON: Writing #{collector} config from node attributes."
  File.open("#{node['panoptimon']['conf_dir']}/collectors/#{collector}.json","w") do |f|
    f.write(JSON.pretty_generate(node['panoptimon']['collector'][collector]))
  end
end
