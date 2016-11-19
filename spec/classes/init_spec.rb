require 'spec_helper'
describe 'fcoe' do

  let :default_params do
    {
      :fcoe_packages     => '["fcoe-utils","lldpad"]',
      :fcoe_service      => '["fcoe","lldpad"]',
      :network_service   => 'network',
    }
  end
  describe 'os-dependent items' do
    context "on RedHat based systems" do
      let :default_facts do
        {
          :os                     => { :family => 'RedHat', :release => { :major => '7', :minor => '1', :full => '7.1.1503' } },
          :kernel                 => 'Linux',
          :path                   => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
        }
      end
      let :params do default_params end
      let :facts do default_facts end
      it { is_expected.to contain_class("fcoe") }
    end
  end
end
