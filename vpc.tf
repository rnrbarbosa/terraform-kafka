resource "aws_vpc" "main" {
  cidr_block = "172.16.0.0/16"

  enabled_dns_support   = true
  enabled_dns_hostnames = true

  tags {
    Name = "My VPC"  
  }
}

resource "aws_internet_gateway" {    
    vpc_id = ${aws_vpc.main.id}
  tags {
    Name = "IGW"
  }
}
