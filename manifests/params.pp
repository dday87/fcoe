# Default Settings
class fcoe::params {

  $fcoe_packages           = ['fcoe-utils','lldpad']
  $fcoe_service            = 'fcoe'
  $fcoe_interface          = []
  $fcoe_enable             = 'yes'
  $dcb_required            = 'no'
  $auto_vlan               = 'yes'
  $dcb_required            = 'no'
  $fcoe_mode               = 'fabric'
  $fip_resp                = 'no'

}
