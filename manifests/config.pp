#
class nrpe::config inherits nrpe {
  if $nrpe::config_manage {
    file { 'nrpe.cfg':
      ensure  => $nrpe::config_ensure,
      name    => $nrpe::config_file,
      content => template($nrpe::config_template),
    }
  }
}
