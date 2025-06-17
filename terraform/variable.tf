variable "aws_region" {
    default = "us-east-2"
  
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "scidr_block" {
  default = "10.0.1.0/24"
}

# ec2

variable "public_key" {
  type = string
}