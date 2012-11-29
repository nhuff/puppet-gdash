require 'spec_helper'

describe 'gdash::dashboard_group' do
  context 'Redhat Default' do
    let(:pre_condition) {'include gdash'}
    let(:facts) {{:osfamily => 'RedHat'}}
    let(:title) {'test_group'}
    it {
      should contain_file('/usr/share/gdash/templates/test_group').
        with_ensure('directory')
    }
  end
end
