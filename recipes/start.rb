if node[:kernel][:os] == "GNU/Linux"
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
