require 'spec_helper'
describe 'fcoe' do

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts.merge({
          # Any required changed facts
        })
      end

      it { is_expected.to contain_class("fcoe") }

      it { is_expected.to contain_package("fcoe-utils") }
      it { is_expected.to contain_package("lldpad") }
      it { is_expected.to contain_service("fcoe") }
      it { is_expected.to contain_service("lldpad") }
      it { is_expected.to contain_service("network") }
    end
  end

end
