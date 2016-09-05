# == Class: nrpe
#
class nrpe (
  $package_manage     = $nrpe::params::package_manage,
  $package_name       = $nrpe::params::package_name,
  $package_ensure     = $nrpe::params::package_ensure,

  $service_manage     = $nrpe::params::service_manage,
  $service_name       = $nrpe::params::service_name,
  $service_ensure     = $nrpe::params::service_ensure,

  $config_manage      = $nrpe::params::config_manage,
  $config_file        = $nrpe::params::config_file,
  $config_template    = $nrpe::params::config_template,

  $allowed_hosts      = $nrpe::params::allowed_hosts,
  $port               = $nrpe::params::port,

  $user               = $nrpe::params::user,
  $group              = $nrpe::params::group,
  $pid_file           = $nrpe::params::pid_file,
  $log_facility       = $nrpe::params::log_facility,

  $command_timeout    = $nrpe::params::command_timeout,
  $connection_timeout = $nrpe::params::connection_timeout,

  $debug              = $nrpe::params::debug,

) inherits nrpe::params {

  validate_bool($package_manage)

  validate_bool($service_manage)

  validate_bool($config_manage)
  validate_absolute_path($config_file)
  validate_string($config_template)

  validate_array($allowed_hosts)
  validate_integer($port)

  validate_string($user)
  validate_string($group)
  validate_absolute_path($pid_file)
  validate_string($log_facility)

  validate_integer($command_timeout)
  validate_integer($connection_timeout)

  validate_bool($debug)
  $real_debug = bool2num($debug)

  # http://docs.puppetlabs.com/puppet/2.7/reference/lang_containment.html#known-issues
  anchor { 'nrpe::begin': } ->
  class { '::nrpe::install': } ->
  class { '::nrpe::config': } ~>
  class { '::nrpe::service': } ->
  anchor { 'nrpe::end': }

}
