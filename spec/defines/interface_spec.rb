require 'spec_helper'
describe 'fcoe::interface' do
  let :pre_condition do
    'class { "fcoe": fcoe_packages => ["fcoe-utils","lldpad"], fcoe_service => ["fcoe","lldpad"], network_service => "network"}'
  end
  let :title do
    'fcoe-eth0'
  end
  let :default_params do
    {
      :fcoe_interface => 'eth0',
      :fcoe_enable    => 'yes',
      :dcb_required   => 'no',
      :auto_vlan      => 'yes',
      :fcoe_mode      => 'fabric',
      :fip_resp       => 'no',
      :fcoe_mtu       => '9000',
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
      it { is_expected.to contain_class("fcoe::params") }
      it do
        is_expected.to contain_file("ifcfg-eth0").with(
          'owner'   => 'root',
          'group'   => 'root',
          'mode'    => '0644',
        )
      end
    end
  end
end
