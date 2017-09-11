resource "aws_vpc" {
  cidr_block = "172.16.0.0/16"

  enabled_dns_support   = true
  enabled_dns_hostnames = true

  tags {
    Name = "My VPC"  
  }
}
