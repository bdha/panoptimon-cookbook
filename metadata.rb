name             "panoptimon"
maintainer       "Sourcefire"
maintainer_email "sysops@sourcefire.com"
license          "All rights reserved"
description      "Installs/Configures panoptimon"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.14"

%w{ centos }.each do |os|
  supports os
end

depends          "daemontools"
