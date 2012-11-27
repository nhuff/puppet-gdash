#Install gdash
class gdash(
  $graphite = '',
  $desc = 'GDash',
){
  include gdash::params

  package{'rubygem-gdash': ensure => 'latest'}

  file{$gdash::params::dashboard_dir:
    ensure  => 'directory',
    recurse => true,
    purge   => true,
    force   => true,
  }

  file{"${gdash::params::app_root}/gdash.yaml":
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('gdash/gdash.erb'),
    require => Package['rubygem-gdash'],
  }
}
