openstack: 
  "OS*":
    - {{ grains['os'] }}
    - rhaig.cluster_resources
    - rhaig.access_resources
    - rhaig.network_resources
