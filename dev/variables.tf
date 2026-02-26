variable "region" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidr" {
  type = string
}

variable "vpc_name" {
  type = string
}
variable "availability_zone" {
  type = string
}

variable "ingress_rules" {
  description = "Ingress rules for dev security group"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}