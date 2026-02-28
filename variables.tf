variable "project_id" {
  type = string
}


variable "region" {
  description = "This is the GCP region"
  type = string
}


# ------------------------- VPC variables -------------------------

variable "local_vpc_name" {
  type = string
  description = "Do enter the vpc name for our application"
}

# ------------------------- Subnet variables -------------------------
variable "local_subnet_name" {
  description = "Name of the Subnet"
  type        = string
}

variable "local_subnet_cidr" {
  description = "CIDR range for the subnet"
  type        = string
}
variable "local_vpc_id" {
  description = "ID of the VPC where the subnet will be created"
  type        = string
}

# ------------------------- GCE variables -------------------------
variable "local_vm_name" {
  description = "Name of the VM instance"
  type        = string
}
variable "local_machine_type" {
  description = "Machine type of the VM instance"
  type        = string
}
variable "local_zone" {
  description = "Zone where the VM instance will be created"
  type        = string
}

