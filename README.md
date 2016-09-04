# link0/puppet-nrpe

## Overview

The [link0/nrpe](https://forge.puppet.com/link0/nrpe) module installs, configures and manages the NRPE service.

## Usage

### 

Basic usage accepting all defaults (installation, configuration, managing the service, etcetera)

```puppet
include ::nrpe
``` 

Although, if you would like to have more control over the service, you can pass parameters like this:

```puppet
class { '::nrpe':
  package_ensure => latest,
  service_manage => false,
}
```

These settings can also be overridden by using Hiera

```yaml
nrpe::service_manage: false
```

## Defining commands

This module is all about defining commands to be called remotely.

```puppet
# This command creates '/etc/nagios/nrpe.d/check_apt.cfg' with the content:
# command[check_apt]=/usr/lib/nagios/plugins/check_apt
nrpe::command { 'check_apt':
}
```

If you want to add arguments, those can be defined as well

```puppet
# This command creates '/etc/nagios/nrpe.d/check_procs.cfg' with the content:
# command[check_procs]=/usr/lib/nagios/plugins/check_procs -w 175 -c 200
nrpe::command { 'check_procs':
  arguments => '-w 175 -c 200',
}
```

You can even specify a custom command, but keep the name NRPE calls

```puppet
# This command creates '/etc/nagios/nrpe.d/check_foo.cfg' with the content:
# command[check_foo]=/usr/bin/foo -w bar -c baz
nrpe::command { 'check_foo':
  command => '/usr/bin/foo',
  arguments => '-w bar -c baz',
}
```

## Customization

### `package_manage`
Whether the package should be managed by puppet. Type: `boolean`. Defaults to `true`
eg `package_manage: false` will not install the package from your package manager

### `package_ensure`
If the package is managed, how to ensure the package, Type: `installed`, `absent` or `latest`. Defaults to `installed`

### `package_name`
If the package is available under a different name, you can specify it here. Type: `string` Defaults to `nagios-nrpe-server`

### `service_manage`
Whether you want puppet to manage the service. Type: `boolean`, defaults to `true`

### `service_ensure`
If the service is managed by puppet, what should be ensured. Type: `running` or `stopped`. Defaults to `running`

### `service_name`
If the service is managed by puppet, what the name of the service should be. Type: `string` Defaults to 'nagios-nrpe-server'.

