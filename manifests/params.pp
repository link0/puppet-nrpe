class nrpe::params {

  $package_manage = true
  $package_name = 'nagios-nrpe-server'
  $package_ensure = installed

  $service_manage = true
  $service_name = 'nagios-nrpe-server'
  $service_ensure = running

}
