provider "aws" {
  region = "ap-south-1"

}

module "vpcreator" {
    source = "./modules/aws-vpc"
    cidr = "10.0.0.0/16"
}

module "publicsubnet" {
    source = "./modules/aws-subnet"
    access = "true"
    cidr = "10.0.1.0/24"
    vpcid = module.vpcreator.vpc_id


}

module "privatesubnet" {
    source = "./modules/aws-subnet"
    access = "false"
    cidr = "10.0.2.0/24"
    vpcid = module.vpcreator.vpc_id


}

module "nat" {
  source = "./modules/aws-NAT"
  nattype = "private"
  subnetid = module.privatesubnet.subnet_id

}


module "securitygroup" {
    source = "./modules/aws-sg"
    vpcid = module.vpcreator.vpc_id
    cidr = "10.0.0.0/16"



}

module "ec2instance" {
    source = "./modules/aws-ec2"
    amiid = "ami-09d56f8956ab235b3"
    key_name = "testuser.pem"
    instype = "t2.micro"
    subnetid = module.privatesubnet.subnet_id
    sgid = module.securitygroup.sg_id



}