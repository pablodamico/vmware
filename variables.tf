# vsphere provider related variables

variable "vsphere_username" {
  description = "Username to login into vsphere"
  type = string
} 

variable "vsphere_password" {
  description = "Username to login into vsphere"
  type = string
}

variable "vsphere_server" {
  description = "Url or ip of the vsphere client"
  type = string
}

variable "vsphere_allow_unverified_ssl" {
  description = "Allow unvrified ssl connections"
  type = bool
  sensitive = true
  default = true
}

# vsphere instance information
variable "vsphere_datacenter" {
  description = "variable to store the datacenter where the instance will be created"
  type = string
  default = "Datacenter"
}
          
variable "vsphere_host" {
  description = "variable to store a esxi host IP/fqdn"
  type = string
  default = ""
}


variable "vsphere_datastore" {
  description = "variable to store the datastore name or absolute path"
  type = string
  default = "Global_Datastore"
}

variable "vsphere_network" {
  description = "variable to store the vm's network"
  type = string
  default = "VM Network"
}


# Instance related information
variable "vm_name" {
  description ="name of the vm/vms. This will be used as the base for vm_name-x.<domain>"
  type = string
}

variable "vm_number" {
  description ="number of instnaces to be created"
  type = number
  default = 1
}

variable "vm_cpus" {
  description ="number of cpus to allocate to the instance"
  type = number
  default = 1
}

variable "vm_memory" {
  description ="ammount of memory to allocate to the instance"
  type = number
  default = 1024
}

variable "vm_template" {
  description ="template to use to deploy in the instance"
  type = string
}

variable "vm_hostname" {
  description = "Name of the instance to be defined at OS level"
  type = string
}

variable "vm_domain" {
  description = "Domain where is the instance will be deployed"
  type = string
}

variable "vm_ip" {
  description = "IP of the instance"
  type = string
}

variable "vm_ip_mask" {
  description = "Mask of the IP of the instance"
  type = number
  default=24
}

variable "vm_gateway" {
  description = "Default gateway of the instance"
  type = string
  default="192.168.1.1"
}

variable "vm_disc_size" {
  description = "Size of the disk"
  type = number
  default=25
}
