class nrpe (
  $package_manage = $nrpe::params::package_manage,
  $package_name   = $nrpe::params::package_name,
  $package_ensure = $nrpe::params::package_ensure,

  $service_manage = $nrpe::params::service_manage,
  $service_name   = $nrpe::params::service_name,
  $service_ensure = $nrpe::params::service_ensure,

) inherits nrpe::params {

  validate_bool($package_manage)

  validate_bool($service_manage)

  # http://docs.puppetlabs.com/puppet/2.7/reference/lang_containment.html#known-issues
  anchor { 'nrpe::begin': } ->
  class { '::nrpe::install': } ->
  class { '::nrpe::config': } ~>
  class { '::nrpe::service': } ->
  anchor { 'nrpe::end': }

}
