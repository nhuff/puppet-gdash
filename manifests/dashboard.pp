define gdash::dashboard(
  $name,
  $description,
  $group,
) {
  $dashboard_dir = "${gdash::params::dashboard_dir}/${group}/${title}"
  file{"${dashboard_dir}/dash.yaml":
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('gdash/dash.erb'),
    require => Gdash::Dashboard_group[$group],
  }

}
