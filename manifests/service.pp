class nrpe::service inherits nrpe {
  if $nrpe::service_manage {
    service { 'nrpe':
      name   => $nrpe::service_name,
      ensure => $nrpe::service_ensure,
    }
  }
}
