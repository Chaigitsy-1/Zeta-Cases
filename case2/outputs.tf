output "vpcid" {
    value = module.vpcreator.vpc_id
        
    }
  
output "publicsubnetid" {
    value = module.publicsubnet.subnet_id
  
}

output "privatesubnetid" {
    value = module.privatesubnet.subnet_id
  
}

output "natgatewayid" {

    value = module.nat.nat_id
  
}

output "securitygroupid" {

    value = module.securitygroup.sg_id
  
}
