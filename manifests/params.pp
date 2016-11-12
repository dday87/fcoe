# Default Settings
class fcoe::params {

  $fcoe_packages           = ['fcoe-utils','lldpad']
  $fcoe_service            = ['fcoe','lldpad']
  $fcoe_enable             = 'yes'
  $dcb_required            = 'no'
  $auto_vlan               = 'yes'
  $fcoe_mode               = 'fabric'
  $fip_resp                = 'no'
  $fcoe_mtu                = undef
  $network_service         = $facts['os']['family'] ? {
    'Debian'          => 'networking',
    default           => 'network',
  }

}
