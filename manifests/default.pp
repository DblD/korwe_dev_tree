#include postgresql::server


exec { "apt-get update":
    path => "/usr/bin",
}


class { 'postgresql::server':
    config_hash => {
    'ip_mask_deny_postgres_user' => '0.0.0.0/32',
    'ip_mask_allow_all_users'    => '0.0.0.0/0',
    'listen_addresses'           => '*',
    'ipv4acls'                   => ['hostssl all johndoe 192.168.0.0/24 cert'],
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

postgresql::database_grant{'tree_services-vagrant':
    privilege => 'ALL',
    db          => 'tree_services',
    role        => 'vagrant'
}


