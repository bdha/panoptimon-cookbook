default['panoptimon']['path']          = '/opt/fire/bin:/opt/fire/sbin:/opt/fire/embedded/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:/root/bin'
default['panoptimon']['user']          = 'root'
default['panoptimon']['group']         = 'root'
default['panoptimon']['conf_dir']      = '/opt/fire/etc/panoptimon'
default['panoptimon']['install_dir']   = '/opt/fire/embedded/lib/ruby/gems/1.9.1/gems/panoptimon-0.3.0'
default['panoptimon']['collectors']    = %w[cpu disk load memory iostat]
default['panoptimon']['plugins']       = %w[status_http daemon_health log_to_file graphite]

default['panoptimon']['disable_plugins']    = %w[]
default['panoptimon']['disable_collectors'] = %w[]

### Core configs.
default['panoptimon']['config']['daemonize']                 = "false"
default['panoptimon']['config']['collector_interval']        = 60
default['panoptimon']['config']['collector_timeout']         = 120

### Plugin configs.
default['panoptimon']['plugin']['log_to_file']['file']       = "/tmp/metrics.log"

default['panoptimon']['plugin']['graphite']['host']          = "graphite1-int.immunet.com"
#default['panoptimon']['plugin']['graphite']['prefix']        = ""

default['panoptimon']['plugin']['status_http']['enabled']    = "true"

default['panoptimon']['plugin']['daemon_health']['interval'] = 10
default['panoptimon']['plugin']['daemon_health']['periods']  = [900,60,20,10]

### Collector configs.
default['panoptimon']['collector']['cpu']['interval']        = 2
default['panoptimon']['collector']['disk']['interval']       = 2
default['panoptimon']['collector']['iostat']['interval']     = 2
default['panoptimon']['collector']['memory']['interval']     = 2
default['panoptimon']['collector']['load']['enabled']        = "true"
