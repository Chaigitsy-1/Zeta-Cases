module "vpcreator" {
    source = "./modules/aws-vpc"
    cidr="10.0.0.0/14"  
}

module "publicsubnet" {
    source = "./module/aws-subnet"
    access= "true"
    cidr="10.0.1.0/24"
    vpcid=module.vpcreator.vpc_id

  
}

module "privatesubnet" {
    source = "./module/aws-subnet"
    access= "false"
    cidr="10.0.2.0/24"
    vpcid=module.vpcreator.vpc_id

  
}

module "nat" {
  source = "./modules/aws-NAT"
  nattype="private"
  subnetid=module.privatesubnet.subnet_id

}


module "securitygroup" {
    source = "./modules/aws-sg"
    vpcid=module.vpcreator.vpc_id
    cidr=module.vpcreator.cidr


  
}

module "ec2instance" {
    source = "./modules/aws-ec2"
    amiid="ami-09d56f8956ab235b3"
    key_name="testuser.pem"
    instype="t2.micro"
    subnetid=module.privatesubnet.subnet_id
    sgid=module.securitygroup.sg_id


  
}
