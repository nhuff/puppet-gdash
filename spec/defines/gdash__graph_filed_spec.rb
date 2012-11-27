require 'spec_helper'

describe 'gdash::graph_field' do
  let(:facts) {{:concat_basedir => '/var/lib/puppet/concat'}}
  context 'Default' do
    let(:title) {'xyz-foo'}
    let(:params) {
      {
        :graph => 'test',
        :dashboard => 'd',
        :dashboard_group => 'g',
        :field_name => 'foo',
        :data       => 'sumSeries(*.load.load)',
      }
    }
    it {
      should contain_concat__fragment('xyz-foo').
        with_target('/usr/share/gdash/templates/g/d/test.graph').
        with_content(/field :foo/).
        with_content(/:data => "sumSeries\(\*\.load.load\)"/).
        with_content(/:derivative => false/)
    }
  end
end 
