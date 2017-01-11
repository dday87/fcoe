# Class: fcoe
# ===========================
#
# Full description of class fcoe here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'fcoe':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class fcoe  (
  $fcoe_packages           = $fcoe::params::fcoe_packages,
  $fcoe_service            = $fcoe::params::fcoe_service,
  $network_service         = $fcoe::params::network_service,
) inherits fcoe::params {

  service { $fcoe_service:
    ensure  => 'running',
    enable  => 'true',
    require => Package[$fcoe_packages],
  }

  service { $network_service:
    ensure  => 'running',
    enable  => 'true',
  }

  package { $fcoe_packages:
    ensure => 'installed',
  }

}
