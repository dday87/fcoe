require 'spec_helper'
describe 'fcoe' do

  let :facts do
    { :os => { 'family' => 'RedHat' } }
  end
  context 'with defaults for all parameters' do
    it { should contain_class('fcoe') }
  end
end
