#
define nrpe::command (
  $command = undef,
  $arguments = '',
) {

  if $command == undef {
    $real_command = "/usr/lib/nagios/plugins/${name}"
  } else {
    $real_command = $command
  }

  $template = 'nrpe/command.erb'

  file { "nrpe-${name}":
    ensure  => file,
    name    => "/etc/nagios/nrpe.d/${name}.cfg",
    content => template($template),
    notify  => Service[$nrpe::service_name],
  }

}
