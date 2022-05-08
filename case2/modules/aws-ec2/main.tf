resource "aws_instance" "instance1" {
ami = "${var.amiid}"
key_name      = "${var.key_name}"
instance_type = "${var.instype}"
vpc_security_group_ids = var.sgid
subnet_id = var.subnetid


tags = {
Name = "ubuntu"
}
}