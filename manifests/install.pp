# == Class: nrpe::install
#
class nrpe::install inherits nrpe {
  if $nrpe::package_manage {
    package { 'nrpe':
      ensure => $nrpe::package_ensure,
      name   => $nrpe::package_name,
    }
  }
}
