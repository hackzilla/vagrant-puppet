class php {

	package { ['php5-fpm', 'php5-cli', 'php5-xdebug', 'php5-mysql', 'php5-intl', 'php5-apcu']:
	  ensure => present,
	  require => Exec['apt-get update'],
	}

	service { 'php5-fpm':
	  ensure => running,
	  require => Package['php5-fpm'],
	}
}
