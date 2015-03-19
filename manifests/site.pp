Package {
    allow_virtual => true
}

include ::ssh::server
::ssh::server::configline { 'PermitRootLogin': value => 'yes' }

class { '::chrony':
    servers => [ '0.pool.ntp.org', '2.centos.pool.ntp.org' ],
}

user { 'dave':
  ensure     => present,
  uid        => '507',
  gid        => '507',
  shell      => '/bin/bash',
  home       => '/home/dave',
  managehome => true,
}

group { 'dave':
  ensure => 'present',
  gid    => '507',
}
