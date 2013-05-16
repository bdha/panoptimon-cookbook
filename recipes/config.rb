directory node['panoptimon']['conf_dir'] do
  owner     node['panoptimon']['user']
  group     node['panoptimon']['group']
  mode      0755
end
