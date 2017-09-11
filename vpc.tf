resource "aws_vpc" "main" {
  cidr_block = "172.16.0.0/16"

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags {
    Name = "My VPC"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "IGW"
  }
}

resource "aws_eip" "eip" {
  vpc = true
}

resource "aws_nat_gateway" "natgw" {
  allocation_id = "${aws_eip.eip.id}"
  subnet_id     = "${aws_subnet.public.id}"

  depends_on = ["aws_internet_gateway.igw"]
}
