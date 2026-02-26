variable "sg_name" {
  description = "Security Group Name"
  type        = string
  default     = "terraform-sg"
}

variable "vpc_id" {
  type = string
}

# variable "allowed_ssh_cidr" {
#   type = list(string)
# }

# variable "allowed_http_cidr" {
#   type = list(string)
# }

variable "ingress_rules" {
  description = "List of ingress rules"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "egress_rules" {
  description = "List of egress rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}