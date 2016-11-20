# fcoe

[![Build Status](https://travis-ci.org/stivesso/fcoe.svg?branch=dev)](https://travis-ci.org/stivesso/fcoe)
[![Coverage Status](https://coveralls.io/repos/github/stivesso/fcoe/badge.svg?branch=dev)](https://coveralls.io/github/stivesso/fcoe?branch=dev)

#### Table of Contents

1. [Module Description - What the module does and why it is useful](#module-description)
2. [Setup - The basics of getting started with fcoe](#setup)
    * [What fcoe affects](#what-fcoe-affects)
    * [Setup requirements](#setup-requirements)
3. [Usage - Configuration options and additional functionality](#usage)
    * [Parameters (and default values)](#parameters)
    * [Sample Usage](#sample-usage)
4. [Limitations and Known Issues](#limitations-and-known-issues)
5. [Development - Guide for contributing to the module](#development)
6. [TODO](#TODO)
7. [Contributors](#contributors)

## Module Description

The fcoe module automates the Configuration and Deployement of Fibre-channel over Ethernet (FCoE) interface(s) on Linux Systems

### What fcoe affects

* The following FCOE Network Interface Configuration files:  
_1. /etc/fcoe/cfg-ethX_  
_2. /etc/sysconfig/network-scripts/ifcfg-ethX_  

### Setup Requirements

fcoe requires:  

- pluginsync = true (Puppet Configuration)  
- puppetlabs/stdlib (>= 4.9.0)

## Usage

### Parameters

There are 07 main parameters used to control the fcoe behaviours: 

**`fcoe_interface`** :  _fcoe Ethernet Interface (ethX)_  
String that specifies the fcoe Interface Name (not optional). 

- _default:_   
-- _**No default parameter, that must be set (example: eth2)**_

**`fcoe_enable`** : _Enable/Disable FCoE service at the Ethernet port_  
String to Enable/Disable FCoE service at the Ethernet port.
Normally set to "yes"
- _default:_ _**yes**_

**`dcb_required`** : _Indicate if DCB service is required at the Ethernet port_  
String to Indicate if DCB service is required at the Ethernet port.
- _default:_ _**no**_

**`auto_vlan`** : _Indicate if VLAN discovery should be handled by fcoemon_  
String to Indicate if VLAN discovery should be handled by fcoemon.
- _default:_ _**yes**_

**`fcoe_mode`** : _Indicate the mode of the FCoE operation, either fabric or vn2vn_  
String to Indicate the mode of the FCoE operation,  
either fabric or vn2vn.
- _default:_ _**fabric**_

**`fip_resp`** : _Indicate whether to run a FIP responder for VLAN discovery in vn2vn mode_  
String to Indicate whether to run a FIP responder for VLAN discovery in vn2vn mode,  
- _default:_ _**no**_

**`fcoe_mtu`** : _Settings the default MTU for the FCOE Interface_  
String to set the default MTU for the FCOE Interface,
The default value is set as undef (leaving the MTU to its default value),
This settings affects ifcfg-ethX Interface
- _default:_ _**undef**_

### Sample Usage

To configure an eth**X** interface by accepting the default values listed above, specify only the fcoe Interface parameter in the fcoe::interface defined type.  
_As with any defined typed,  this can be evaluated multiple times with different parameters._  
_The following examples configures both eth2 and eth3 as FCOE Interfaces with default settings:_

```sh
fcoe::interface { 'eth2':
    fcoe_interface  => 'eth2',
}
fcoe::interface { 'eth2':
    fcoe_interface  =>'eth3',
}
```
To modify some of the default settings,
```sh
fcoe::interface { 'eth2':
    fcoe_interface  => 'eth2',
    fcoe_enable     => 'yes',
    dcb_required    => 'no',
    auto_vlan       => 'yes',
    fcoe_mode       => 'fabric',
    fip_resp        => 'no',
    fcoe_mtu        => '9000',
}
fcoe::interface { 'eth2':
    fcoe_interface  =>'eth3',
    fcoe_enable     => 'yes',
    dcb_required    => 'no',
    auto_vlan       => 'yes',
    fcoe_mode       => 'fabric',
    fip_resp        => 'no',
    fcoe_mtu        => '9000',
}
```
Below is the same configuration using Hiera and create_resources
```sh
  # FCOE
  # Create a hash from Hiera Data with the FCOE Interfaces
  $myFcoeIfaces = hiera('fcoe::interface', {})
  # With Create Resource Converts a hash into a set of resources
  create_resources('fcoe::interface', $myFcoeIfaces)
```
On my Hiera Yaml files,
```yaml
---
fcoe::interface:
  'eth2':
    fcoe_interface   : 'eth2'
    fcoe_enable      : 'yes'
    dcb_required     : 'no'
    auto_vlan        : 'yes'
    fcoe_mode        : 'fabric'
    fip_resp         : 'no'
    fcoe_mtu         : '9000'
  'eth3':
    fcoe_interface   : 'eth3'
    fcoe_enable      : 'yes'
    dcb_required     : 'no'
    auto_vlan        : 'yes'
    fcoe_mode        : 'fabric'
    fip_resp         : 'no'
    fcoe_mtu         : '9000'


```

## Limitations and Known Issues

## Development
I happily accept bug reports and pull requests via github,  
https://github.com/stivesso/fcoe

- Fork it
- Create a feature branch
- Write a failing test
- Write the code to make that test pass
- Refactor the code
- Submit a pull request

## TODO

- Add Support for other OS Family (Debian, SuSe, Solaris...)

## Contributors

- The module is written and being maintained by: [stivesso](https://github.com/stivesso) 
