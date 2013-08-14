class { 'java':
    distribution => 'jdk',
    version      => 'latest',
}

package{'libboost-all-dev':
  ensure => installed,

}

package{'cmake':
  ensure => installed,
}

package{'vim':
  ensure => installed,
}

package{'nodejs':
  ensure => installed,
}

package{'libqpidmessaging2-dev':
  ensure => installed,
}

package{'libqpidclient2-dev':
  ensure => installed,
}

package{'libqpidcommon2-dev':
  ensure => installed,
}

package{'libqpidtypes1-dev':
  ensure => installed;
}

package{'qpid-tools':
  ensure => installed,
}


include rvm
rvm::system_user {vagrant:;root:;}
rvm_system_ruby {
    'ruby-1.9.3-p385':
      ensure => 'present',
      default_use => true
}

class{ 'qpid::server':
    package_name => 'qpidd',
    service_ensure  => 'running',
    auth            => 'no',
    config_file     => '/etc/qpid/qpidd.conf'
}

class { 'postgresql::server':
    config_hash => {
    'ip_mask_deny_postgres_user' => '0.0.0.0/32',
#    'ip_mask_allow_all_users'    => '0.0.0.0/0',
    'listen_addresses'           => '*',
#    'ipv4acls'                   => ['hostssl all all  192.168.0.0/24 cert'],
    'manage_redhat_firewall'     => true,
    'postgres_password'          => 'vagrant',
    },
}

postgresql::db { 'vagrant':
    user     => 'vagrant',
    password => 'vagrant',
    grant => 'ALL'

}

postgresql::db { 'tree_services':
    user     => 'korwe',
    password => 'korwe',
    grant    => 'ALL'

}

postgresql::pg_hba_rule { 'allow korwe applicaiton acount acceess to the database':
  description => "Open up postgresql for access from 127.0.0.0/24",
  type => 'local',
  database => 'tree_services',
  user => 'korwe',
  #address => '0.0.0.0/0',
  auth_method => 'md5',
}

#postgresql::database_grant{'tree_services-vagrant':
#    privilege => 'ALL',
#    db          => 'tree_services',
#    role        => 'vagrant'
#}

class { 'gradle':
  version => '1.7',
}
