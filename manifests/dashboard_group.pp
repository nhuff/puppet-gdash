define gdash::dashboard_group{
  include gdash::params
  file{"${gdash::params::dashboard_dir}/${title}":
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }
}
