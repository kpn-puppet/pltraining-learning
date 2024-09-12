class learning::install {
  
  $prod_module_path = '/etc/puppetlabs/code/environments/production/modules'

  # Install mutli_node module
  include learning::multi_node
  include pe_repo::platform::ubuntu_2004_amd64

  # Install pltraining-dockeragent module
  include docker
  include learning::dockeragent

  package { 'python-pip':
    ensure => 'present',
  }

  # Symlink pip to /usr/bin/pip-python where the provider expects it
  file { '/usr/bin/pip-python':
    ensure  => symlink,
    target  => '/usr/bin/pip',
    require => Package['python-pip']
  }

  # This class sets up a local pypi server so we can run offline
  #class { 'learning::pypi_server':
  #  pypi_dir     => '/opt/pypiserver',
  #  pypi_pkg_dir => '/opt/pypiserver/packages',
  #  require      => File['/usr/bin/pip-python'],
  #}

  # Install or cache everything we need for graphite
  #class { 'learning::graphite_reqs':
  #  pypi_dir     => '/opt/pypiserver',
  #  pypi_pkg_dir => '/opt/pypiserver/packages',
  #  require      => Class['learning::pypi_server'],
  #}

  # Set up an apache server and vhost to serve graphite
  #include learning::graphite_server

  #service {['pe-puppet', 'puppet']:
  #  ensure  => 'stopped',
  #  enable => 'false',
  #}

  #package { 'graphviz':
  #  ensure  => 'present',
  #}

  file { ['/etc/motd', '/root/README']:
    ensure => 'file',
    owner  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/learning/README',
  }

  file { '/var/lib/hiera':
    ensure => directory,
  }

  file { '/usr/local/bin/reset_demo':
    ensure => 'file',
    owner  => 'root',
    mode   => '0500',
    source => 'puppet:///modules/learning/reset_demo',
  }

  #enable GSSAPIAuthentication so we can disable it in the quest
  file_line { 'sshd_config':
    ensure => present,
    path   => '/etc/ssh/sshd_config',
    line   => 'GSSAPIAuthentication yes',
    match  => '^GSSAPIAuthentication',
  }
  file { '/etc/puppetlabs/bolt':
    ensure => 'directory',
    owner  => 'root',
    group  => 'adminuser', 
    mode   => '0775',
  }  
  file { '/etc/puppetlabs/bolt/inventory.yaml':
    ensure => 'file',
    owner  => 'root',
    group  => 'adminuser',
    mode   => '0664',
    source => 'puppet:///modules/learning/bolt/inventory.yaml',
    require => File['/etc/puppetlabs/bolt'],
  }
  file { '/etc/puppetlabs/bolt/bolt-project.yaml':
    ensure => 'file',
    owner  => 'root',
    group  => 'adminuser',
    mode   => '0664',
    source => 'puppet:///modules/learning/bolt/bolt-project.yaml',
    require => File['/etc/puppetlabs/bolt'],
  }
  $hosts = {
    'node-1' => '10.0.1.101',
    'node-2' => '10.0.1.102',
    'node-3' => '10.0.1.103',
    'node-4' => '10.0.1.104',
    'node-5' => '10.0.1.105',
    'node-6' => '10.0.1.106',
    'node-7' => '10.0.1.107',
    'node-8' => '10.0.1.108',
    'node-9' => '10.0.1.109',
    'node-10' => '10.0.1.110',
    'node-11' => '10.0.1.111',
    'node-12' => '10.0.1.112',
    'node-13' => '10.0.1.113',
    'node-14' => '10.0.1.114',
    'node-15' => '10.0.1.115',
    'node-16' => '10.0.1.116',
    'node-17' => '10.0.1.117',
    'node-18' => '10.0.1.118',
    'node-19' => '10.0.1.119',
    'node-20' => '10.0.1.120'
  }
  $hosts.each |$k, $v| {
    host { $k:
      ensure       => present,
      host_aliases => ["${k}.internal.cloudapp.net"],
      ip           => $v,
      target       => '/etc/hosts'
    }
  }
}
