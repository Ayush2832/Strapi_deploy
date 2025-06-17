resource "aws_security_group" "nsg1" {
    vpc_id = aws_vpc.main.id
    name = "strapi-secutirygroup"

    description = "Necessary inbound rules"

    ingress {
        description = "Strapi port"
        from_port = 1337
        to_port = 1337
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    ingress {
        description = "SSH port"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    tags = {
        Name = "security-group"
    }
}

resource "aws_key_pair" "deployer" {
  key_name   = "publickey2"
  public_key = var.public_key
}

resource "aws_instance" "strapi_ec2" {
  ami                    = "ami-0d1b5a8c13042c939"
  instance_type          = "t2.medium"
  subnet_id              = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.nsg1.id]
  key_name               = aws_key_pair.deployer.key_name
  associate_public_ip_address = true
  user_data = file("${path.module}/script.sh")

  tags = {
    Name = "strapi_vm"
  }
}