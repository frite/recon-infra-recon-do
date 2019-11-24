// The following variables must be set during runtime.
variable "do_token" {}
variable "ssh_fingerprint" {}

// Values that can be left as is.

variable "ssh_user" {
  default = "root"
}

variable "ssh_pub_key_path" {
  default = "~/.ssh/id_rsa.pub"
}

variable "ssh_pvt_key_path" {
  default = "~/.ssh/id_rsa"
}

variable "vm_num_of_droplets" {
  default = 1
}
variable "vm_image" {
  default = "ubuntu-18-04-x64"
}
variable "vm_region" {
  default = "lon1"
}
variable "vm_size" {
  default = "s-1vcpu-2gb"
}
variable "vm_private_networking" {
  default = true
}
variable "vm_backups" {
  default = false
}
variable "vm_monitoring" {
  default = true
}
variable "vm_ipv6" {
  default = true
}
variable "vm_name" {
  default = "recon-ubuntu-net-recon"
}

variable "vm_tags" {
  default = ["recon-dns"]
}
