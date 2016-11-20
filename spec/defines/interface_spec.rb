require 'spec_helper'
describe 'fcoe::interface' do
  let :pre_condition do
    'class { "fcoe": fcoe_packages => ["fcoe-utils","lldpad"], fcoe_service => ["fcoe","lldpad"], network_service => "network"}'
  end
  let :title do
    'fcoe-eth0'
  end
  let :params do
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
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts.merge({
          # Any required changed facts
        })
      end

      it { is_expected.to contain_class("fcoe") }
      it { is_expected.to contain_class("fcoe::params") }
      it do
        is_expected.to contain_file("ifcfg-eth0").with(
          'owner'   => 'root',
          'group'   => 'root',
          'mode'    => '0644',
          'content' => /DEVICE=eth0/,
        )
      end
      it do
        is_expected.to contain_file("cfg-eth0").with(
          'owner'   => 'root',
          'group'   => 'root',
          'mode'    => '0644',
          'content' => /MODE="fabric"/,
        )
      end
    end
  end

end
