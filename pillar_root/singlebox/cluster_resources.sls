cluster_name: "singlebox"

cluster_type: "juno"

db_engine: "mysql"

queue_engine: "rabbit"

#reset: "<soft/hard>"

hosts: 
  "OS-cont": "192.168.0.201"

roles:
  - "controller"
  - "network"
  - "storage"
  - "compute"

controller: "OS-cont"
network: "OS-cont"
storage:
  - "OS-cont"
compute: 
  - "OS-cont"

sls: 
  - controller: 
    - "ntp"
    - "mysql"
    - "mysql.client"
    - "mysql.openstack_dbschema"
    - "queue.rabbit"
    - "keystone"
    - "keystone.openstack_tenants"
    - "keystone.openstack_users"
    - "keystone.openstack_services"
    - "glance"
    - "glance.images"
    - "nova"
    - "neutron"
    - "neutron.ml2"
    - "horizon"
    - "cinder"
    - "heat"
  - network: 
    - "mysql.client"
    - "neutron.services"
    - "neutron.ml2"
    - "neutron.openvswitch"
    - "neutron.networks"
    - "neutron.routers"
    - "neutron.security_groups"
  - compute: 
    - "mysql.client"
    - "nova.compute_kvm"
    - "neutron.openvswitch"
    - "neutron.ml2"
  - storage:
    - "mysql.client"
    - "cinder.volume"

#glance image-create --copy-from http://download.cirros-cloud.net/0.3.3/cirros-0.3.3-x86_64-disk.img --disk-format qcow2 --container-format bare --name 'CirrOS'
glance:
  images:
    CirrOS:
      min_disk: "0"
      min_ram: "0"
      copy_from: "http://download.cirros-cloud.net/0.3.3/cirros-0.3.3-x86_64-disk.img"
      user: "admin"
      tenant: "admin"
      disk_format: "qcow2"
      container_format: "bare"
      is_public: "True"
      protected: "False"

cinder:
  volumes_group_name: "cinder-volumes"
  volumes_path: "/var/lib/cinder/cinder-volumes"
  volumes_group_size: "10"
  loopback_device: "/dev/loop0"

nova:
  cpu_allocation_ratio: "16"
  ram_allocation_ratio: "1.5"

files:
  keystone_admin:
    path: "/root/openrc/"
