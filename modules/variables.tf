variable "xo_url" {
  description = "Url xen orchestra Must be ws or wss e.g ws://10.50.1.1"
  type        = string
}

variable "xo_username" {
  description = "Username xen orchestra."
  type        = string
}

variable "xo_password" {
  description = "Password xen orchestra."
  type        = string
  sensitive = true
}

variable "pool_name" {
  description = "Name of pool to create vm."
}

variable "hostname" {
  description = "hostname of VM"
}

variable "storage" {
  default = "Local storage"
}

variable "memory_max" {
  default = "2073733640" #2GB
}

variable "disk_size" {
  default = "32212254720" #30GB
}

variable "num_cpus" {
  default = 2
}

variable "source_template_family" {
  type = string
}

variable "associate_pool_network" {
  type = string
}

variable "vm_description" {
  default = "Created by Terraform"
}

variable "vm_tags" {
  default = [null]
}

variable "ip_config" {
}