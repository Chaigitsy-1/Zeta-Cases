resource "aws_nat_gateway" "pvtnat" {
  connectivity_type = var.nattype
  subnet_id         =  var.subnetid 
}