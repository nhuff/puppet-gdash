require 'spec_helper'

describe 'gdash' do
  let(:params){{:graphite => 'http://graphite.com'}}
  it{
    should contain_package('gdash')
    should contain_file('/usr/share/gdash/templates').
      with_ensure('directory')
    should contain_file('/usr/share/gdash/gdash.yaml').
      with_content(/:graphite: http:\/\/graphite.com/).
      with_content(/:templatedir: \/usr\/share\/gdash\/templates/).
      with_content(/:title: GDash/)
  }
end
