class nrpe::install inherits nrpe {
  if $nrpe::package_manage {
    package { 'nrpe':
      name   => $nrpe::package_name,
      ensure => $nrpe::package_ensure,
    }
  }
}
