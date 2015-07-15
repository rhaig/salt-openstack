
neutron: 
  integration_bridge: "br-int"

  external_bridge: "br-flat"

  single_nic: 
    enable: "False"
    #interface: "<interface_name>"

  metadata_secret: "cisco123"

  type_drivers: 
    flat: 
      physnets: 
        physnet1: 
          bridge: "br-flat"
          hosts:
            "OS-cont>": "eth2"

  networks:
    default_net:
      user: "admin"
      tenant: "admin"
      provider_physical_network: "physnet1"
      provider_network_type: "flat"
      shared: "True"
      admin_state_up: "True"
      router_external: "True"
      subnets:
        default_subnet:
          cidr: '192.168.36.0/24'
          allocation_pools:
            - start: '192.168.36.100'
              end: '192.168.36.200'
          enable_dhcp: "True"
          dns_nameservers:
            - 8.8.8.8
            - 8.8.4.4


  security_groups:
    default:
      user: "admin"
      tenant: "admin"
      description: "admin"
      rules: 
        - direction: "ingress"
          ethertype: "IPv4"
          protocol: "tcp"
          port_range_min: "22"
          port_range_max: "22"
          remote_ip_prefix: "0.0.0.0/0"
