provider "google" {
  project = var.project_id
  region = var.region
}

# ------------------------- VPC module -------------------------
module "vpc" {
    source = "git::https://github.com/devopswithcloud/i27-terraform-b25-modules.git//vpc?ref=v1.0.0"
    vpc_name = var.local_vpc_name
}

# ------------------------- Subnet module -------------------------
module "subnet" {
    source = "git::https://github.com/devopswithcloud/i27-terraform-b25-modules.git//subnet?ref=v1.0.0"
    subnet_name = var.local_subnet_name
    region = var.region
    subnet_cidr = var.local_subnet_cidr
    vpc_id = module.vpc.vpc_id
    depends_on = [ module.vpc ] # explicit dependency to ensure subnet is created after vpc
}

# ------------------------- GCE module -------------------------
module "gce" {
    source = "git::https://github.com/devopswithcloud/i27-terraform-b25-modules.git//subnet?ref=v1.0.0"
    vm_name = var.local_vm_name
    machine_type = var.local_machine_type
    zone = var.local_zone
    subnet_id = module.subnet.subnet_id
    depends_on = [ module.subnet ]
}







