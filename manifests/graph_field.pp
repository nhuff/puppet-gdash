define gdash::graph_field(
  $dashboard_group,
  $dashboard,
  $graph,
  $field_name,
  $data,
  $derivative = false,
  $as_line = false,
  $scale_to_seconds = false,
) {
  include gdash::params

  $r_derivative = $derivative ? {
    true    => 'true',
    false   => 'false',
    default => $derivative,
  }

  $r_line = $as_line ? {
    true    => 'true',
    false   => 'false',
    default => $as_line,
  }

  $graph_file = "${gdash::params::dashboard_dir}/${dashboard_group}/${dashboard}/${graph}.graph"
  concat::fragment{$title:
    target  => $graph_file,
    content => template('gdash/graph_field.erb'),
  }
}
