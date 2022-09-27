# A manifest to install nginx web server and set custom header

exec { 'apt-get update':
  command => '/usr/bin/apt-get -y update',
}

package { 'nginx':
  ensure  => 'installed',
  require => Exec['apt-get update'],
}

file { 'index-html':
  ensure  => 'present',
  path    => '/var/www/html/index.html',
  content => 'Hello World!',
}

file_line { 'custom-header':
  path    => '/etc/nginx/sites-available/default',
  after   => 'server_name _;',
  line    => 'add_header X-Served-By $hostname;',
  notify  => Service['nginx'],
  require => Package['nginx'],
}

service { 'nginx':
  ensure => running,
  enable => true,
}