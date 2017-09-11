data "aws_availability_zones" "available" {}

resource "aws_subnet" "public" {
    
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "${cidrsubnet(aws_vpc.main.cidr_block, 8, 1)}"
    availability_zone = "${data.aws_availability_zones.available.names[0]}"
    map_public_ip_on_launch = true

    tags {
        Name = "Public Network"
    }
}

resource "aws_subnet" "private" {
    
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "${cidrsubnet(aws_vpc.main.cidr_block, 8, 2)}"
    availability_zone = "${data.aws_availability_zones.available.names[0]}"

    tags {
        Name = "Public Network"
    }
}
