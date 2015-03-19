# == Class: base
#
# Full description of class base here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { base:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Sebastian Ickler <ickler@gmail.com>
#
# === Copyright
#
# Copyright 2015 Sebastian Ickler
#
class base {
  
  class { 'ssh':
    storeconfigs_enabled => true,
    server_options => {
      'Protocol'        => '2',
      'Port'            => '22',
      'PermitRootLogin' => 'yes', 
     }
  }
  
  class { 'chrony':
      servers => [ '0.pool.ntp.org', '2.centos.pool.ntp.org' ],
  }
  
  user { 'si':
    ensure           => 'present',
    gid              => '1000',
    home             => '/home/si',
    password         => '$6$VOO8d18g$KyBu59ZZbAxLcFw7jzlWwl2hK2KbvamCYzZDNJz3poD9jwzmMeDnUnb50PUhD0uv2hRvpopgwJUptdwv/VngF1',
    password_max_age => '99999',
    password_min_age => '0',
    shell            => '/bin/bash',
    uid              => '1000',
  }
  
  group { 'si':
    ensure => 'present',
    gid    => '1000',
  }
}
