define gdash::graph(
  $graph_title,
  $vtitle,
  $description,
  $dashboard_group,
  $dashboard,
  $area=':none',
) {
  include concat::setup
  include gdash::params
  $gfile = "${gdash::params::dashboard_dir}/${dashboard_group}/${dashboard}/${title}.graph"
  concat{$gfile:
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Gdash::Dashboard[$dashboard],
  }
  concat::fragment{"${title}_header":
    target  => $gfile,
    content => template('gdash/graph_header.erb'),
    order   => '01',
  }
}
