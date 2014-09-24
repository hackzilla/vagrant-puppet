class php {

	package { ['php5-fpm', 'php5-cli', 'php5-xdebug', 'php5-mysql', 'php5-intl', 'php5-apcu']:
	  ensure => present,
	  require => Exec['apt-get update'],
	}

	file { '/var/log/php5-fpm.log':
	  ensure  => 'link',
	  target  => '/vagrant/log/php5-fpm.log',
	}

	file { '/etc/php5/fpm/pool.d/www.conf':
 	  source  => 'puppet:///modules/php/www.conf',
	  require => Package['mysql-server'],
	  notify  => Service['mysql'],
	}

	service { 'php5-fpm':
	  ensure => running,
	  require => Package['php5-fpm'],
	}
}
