module "K8S-MASTER-01" {
  source  = "modules/"
  source_template_family = "debian-stretch9-with-cloudinit"
  
  xo_url = var.xo_url
  xo_username = var.xo_username
  xo_password = var.xo_password
  
  associate_pool_network = "staging"
  pool_name = "PoolName"
  # You can use static ip
  ip_config = ""
  hostname  = "K8S-MASTER-01"
  storage  =   "local-storage"

  vm_tags = ["k8s-test"]
  memory_max = "4294967296" #4Gb

  disk_size = "32212254720" #30Gb
  num_cpus = "2"
}

module "K8S-WORKER-01" {
  source  = "modules/"
  source_template_family = "debian-stretch9-with-cloudinit"
  
  xo_url = var.xo_url
  xo_username = var.xo_username
  xo_password = var.xo_password
  
  associate_pool_network = "staging"
  pool_name = "PoolName"
  # You can use static ip
  ip_config = ""
  hostname  = "K8S-WORKER-01"
  storage  =   "local-storage"

  vm_tags = ["k8s-test"]
  memory_max = "4294967296" #4Gb

  disk_size = "32212254720" #30Gb
  num_cpus = "2"
}

module "K8S-WORKER-02" {
  source  = "modules/"
  source_template_family = "debian-stretch9-with-cloudinit"
  
  xo_url = var.xo_url
  xo_username = var.xo_username
  xo_password = var.xo_password
  
  associate_pool_network = "staging"
  pool_name = "PoolName"
  # You can use static ip
  ip_config = ""
  hostname  = "K8S-WORKER-02"
  storage  =   "local-storage"

  vm_tags = ["k8s-test"]
  memory_max = "4294967296" #4Gb

  disk_size = "32212254720" #30Gb
  num_cpus = "2"
}