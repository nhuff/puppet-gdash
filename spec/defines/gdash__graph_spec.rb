require 'spec_helper'

describe 'gdash::graph' do
  context 'Default Redhat' do
    let(:facts) {
      {
        :osfamily       => 'RedHat',
        :concat_basedir => '/var/lib/puppet/concat',
      }
    }
    let(:title) {'test_graph'}
    let(:params) {
      {
        :graph_title => 'Test Graph',
        :vtitle      => 'Vtitle',
        :description => 'Graph Desc',
        :dashboard_group  => 'test_group',
        :dashboard => 'test_dash',
      }
    }
    it {
      should contain_concat('/usr/share/gdash/templates/test_group/test_dash/test_graph.graph')
      should contain_concat__fragment('test_graph_header').
        with_content(/title "Test Graph"/).
        with_content(/vtitle "Vtitle"/).
        with_content(/description "Graph Desc"/).
        with_content(/area :none/)
    }
  end
end
