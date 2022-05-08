resource "aws_subnet" "subnetterraform" {
  vpc_id     = var.vpcid
  cidr_block = var.cidr
  map_public_ip_on_launch = var.access
  availability_zone = var.AWS_REGION 
  tags = {
    Name = "subnetterraform"
  }
}