class gdash::params (
  $app_root = '/usr/share/gdash',
  $template_dir = ''
){
  $dashboard_dir = $template_dir ? {
    ''      => "${app_root}/templates",
    default => $template_dir,
  }
}
