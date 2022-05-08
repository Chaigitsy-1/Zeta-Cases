resource "aws_vpc" "vpcgen" {
  cidr_block       = "${var.cidr}"
  instance_tenancy = "default"
  enable_dns_support="true"
  enable_dns_hostnames="true"
  enable_classiclink = "false"
  tags = {
    Name = "vpcgen"
  }
}