# == Class: nrpe::service
#
class nrpe::service inherits nrpe {
  if $nrpe::service_manage {
    service { 'nrpe':
      ensure => $nrpe::service_ensure,
      name   => $nrpe::service_name,
    }
  }
}
