terraform {
  required_version = "<2"
  
  required_providers {
    vsphere = {
      source = "hashicorp/vsphere"
      version = "2.8.1"
    }
  }
}
