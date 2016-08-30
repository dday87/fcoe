# This defined type configures the fcoe for defined interface
define fcoe::interface(
  $fcoe_interface,
  $fcoe_enable             = $fcoe::params::fcoe_enable,
  $dcb_required            = $fcoe::params::dcb_required,
  $auto_vlan               = $fcoe::params::auto_vlan,
  $fcoe_mode               = $fcoe::params::fcoe_mode,
  $fip_resp                = $fcoe::params::fip_resp,
) {

  include fcoe # contains Package['fcoe-utils','lldpad'] and Service['fcoe']

  file { "cfg-${fcoe_interface}":
    ensure  => file,
    path    => "/etc/fcoe/cfg-${fcoe_interface}",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('fcoe/cfg-ethx.erb'),
    notify  => Service[$fcoe::params::fcoe_service],
  }

}
