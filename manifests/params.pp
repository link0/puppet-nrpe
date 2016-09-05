class nrpe::params {

  $package_manage = true
  $package_name = 'nagios-nrpe-server'
  $package_ensure = installed

  $service_manage = true
  $service_name = 'nagios-nrpe-server'
  $service_ensure = running

  $config_manage = true
  $config_file = '/etc/nagios/nrpe.cfg'
  $config_template = 'nrpe/nrpe.cfg.erb'

  $allowed_hosts = ['127.0.0.1']
  $port = 5666

  $user = 'nagios'
  $group = 'nagios'
  $pid_file = '/var/run/nagios/nrpe.pid'

  $log_facility = 'daemon'

  $command_timeout = 60
  $connection_timeout = 300

  $debug = false

}
