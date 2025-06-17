output "vpc" {
  description = "VPC is"
  value = aws_vpc.main.id
}

output "ec2" {
    description = "EC2 ip is"
    value = aws_instance.strapi_ec2.public_ip
}