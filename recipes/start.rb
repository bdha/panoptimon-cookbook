if node[:kernel][:os] == "GNU/Linux"
  directory "/var/lib/service/panoptimon/env" do
    mode        0775
    owner       "root"
    group       "root"
    action      :create
    recursive   true
  end

  template "/var/lib/service/panoptimon/env/PATH" do
    source      "envdir/PATH.erb"
    variables(
      :envpath => node[:panoptimon][:path]
    )
  end

  directory "/var/lib/service/panoptimon/log/main" do
    mode        0775
    owner       "multilog"
    group       "multilog"
    action      :create
    recursive   true
  end

  daemontools_service "panoptimon" do
    directory   "/var/lib/service/panoptimon"
    template    "panoptimon"
    action      [:enable,:start]
    log         true
  end
end
