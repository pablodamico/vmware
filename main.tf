data "vsphere_datacenter" "datacenter" {
  name = var.vsphere_datacenter
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  name          = var.vsphere_network
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "template" {
	name					= var.vm_template
	datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_host" "host" {
  name          = var.vsphere_host
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_virtual_machine" "vm" {
  name             = var.vm_name
  datastore_id     = data.vsphere_datastore.datastore.id
	resource_pool_id		= data.vsphere_host.host.resource_pool_id
  num_cpus         = var.vm_cpus
  memory           = var.vm_memory
  guest_id						= "other3xLinux64Guest"
  firmware = "efi"
  network_interface {
      network_id = data.vsphere_network.network.id
  }
  disk {
      label = "disk0"
      size  = 25
  }
  clone {
     template_uuid = data.vsphere_virtual_machine.template.id
     customize {
       linux_options {
         host_name = var.vm_hostname
         domain    = var.vm_domain
       }
       network_interface {
         ipv4_address = var.vm_ip
         ipv4_netmask = var.vm_ip_mask
       }
       ipv4_gateway = var.vm_gateway
     }
   }
  
}
