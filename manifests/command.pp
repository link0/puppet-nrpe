#
define nrpe::command (
  $command = undef,
  $arguments = "",
) {

  if $command == undef {
    $real_command = "/usr/lib/nagios/plugins/${name}"
  } else {
    $real_command = $command
  }

  $template = 'nrpe/command.erb'

  file { "nrpe-${name}":
    name    => "/etc/nagios/nrpe.d/${name}.cfg",
    ensure  => file,
    content => template($template),
    notify  => Service[$nrpe::service_name],
  }

}
