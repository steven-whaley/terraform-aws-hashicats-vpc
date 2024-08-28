# WARNING: Generated module tests should be considered experimental and be reviewed by the module author.

variables {
  prefix        = "test"
  region        = "us-west-2"
  address_space = "10.0.0.0/16"
  subnet_prefix = "10.0.10.0/24"
}

provider "aws" {
  region = var.region
}

run "vpc_validation" {
  assert {
    condition     = aws_vpc.hashicat.enable_dns_hostnames == true
    error_message = "DNS hostnames should be enabled"
  }
}

run "security_group_validation" {
  assert {
    condition     = aws_security_group.hashicat.vpc_id == aws_vpc.hashicat.id
    error_message = "incorrect VPC ID for security group"
  }
}

run "internet_gateway_validation" {
  assert {
    condition     = aws_internet_gateway.hashicat.vpc_id == aws_vpc.hashicat.id
    error_message = "incorrect VPC ID for internet gateway"
  }
}

run "route_table_validation" {
  assert {
    condition     = aws_route_table.hashicat.vpc_id == aws_vpc.hashicat.id
    error_message = "incorrect VPC ID for route table"
  }
}

run "route_table_association_validation" {
  assert {
    condition     = aws_route_table_association.hashicat.subnet_id == aws_subnet.hashicat.id
    error_message = "incorrect subnet ID for route table association"
  }

  assert {
    condition     = aws_route_table_association.hashicat.route_table_id == aws_route_table.hashicat.id
    error_message = "incorrect route table ID for route table association"
  }
}