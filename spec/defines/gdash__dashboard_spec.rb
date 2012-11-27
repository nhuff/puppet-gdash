require 'spec_helper'

precon = <<EOF
include gdash
gdash::dashboard_group{'test_group':}
EOF

describe 'gdash::dashboard' do
  let(:pre_condition) {precon}
  context 'Redhat Default' do
    let(:facts) {{ :osfamily => 'RedHat' }}
    let(:title) {'test_dashboard'}
    let(:params) {
      {
        :group => 'test_group',
        :name  => 'Test Dashboard',
        :description => 'Dashboard for testing'
      }
    }
    it {
      should contain_file('/usr/share/gdash/templates/test_group/test_dashboard/dash.yaml').
        with_content(/:name: Test Dashboard/).
        with_content(/:description: Dashboard for testing/)
    }
  end
end
