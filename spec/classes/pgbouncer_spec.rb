require 'spec_helper'

describe 'pgbouncer' do
  let(:facts) do
    {
      :operatingsystem => 'Debian',
      :concat_basedir  => '/var/lib/puppet' # required by concat
    }
  end

  describe 'with only required parameters provided' do
    let(:params) do
      {}
    end
    it 'includes the class' do
      should contain_class('pgbouncer')
    end
    it 'has the service' do
      subject.should contain_service('pgbouncer')
    end
    it 'has the package installed' do
      subject.should contain_package('pgbouncer')
    end
    it 'has the init file replaced' do
      should contain_file('/etc/init.d/pgbouncer')
    end
  end
end
