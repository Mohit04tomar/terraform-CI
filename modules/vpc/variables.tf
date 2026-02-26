variable "vpc_cidr" {
  description = "CIDR of VPC"
  type        = string

  validation {
    condition     = can(cidrnetmask(var.vpc_cidr))
    error_message = "Invalid CIDR of VPC"
  }
}

variable "vpc_name" {
  description = "Name of VPC"
  type        = string
  default = "terraform-vpc"
}

variable "vpc_env" {
  description = "Name of environment or team for which VPC will be created"
  type = string
  default = "dev"
}

variable "pub_sub_cidr" {
  description = "CIDR of subnet"
  type        = string

  validation {
    condition     = can(cidrnetmask(var.pub_sub_cidr))
    error_message = "Invalid CIDR of Public Subnet"
  }
}

variable "pub_subnet_name" {
  description = "Name of Public Subnet"
  type = string
  default = "public-subnet"
}

variable "igw_name" {
  description = "Name of Internet Gateway"
  type = string
  default = "terraform-igw"
}

variable "routing_table_name" {
  description = "Name of Routing Table"
  type = string
  default = "terraform-route-table"
}

variable "availability_zone" {
  type = string
} 