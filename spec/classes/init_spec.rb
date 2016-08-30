require 'spec_helper'
describe 'fcoe' do

  context 'with defaults for all parameters' do
    it { should contain_class('fcoe') }
  end
end
