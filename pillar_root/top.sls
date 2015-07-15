openstack: 
  "OS*":
    - {{ grains['os'] }}
    - singlebox.cluster_resources
    - singlebox.access_resources
    - singlebox.network_resources
