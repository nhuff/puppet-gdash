define gdash::graph_field(
  $dashboard_group,
  $dashboard,
  $graph,
  $field_name,
  $data
) {
  include gdash::params
  $graph_file = "${gdash::params::dashboard_dir}/${dashboard_group}/${dashboard}/${graph}.graph"
  concat::fragment{$title:
    target  => $graph_file,
    content => template('gdash/graph_field.erb'),
  }
}
