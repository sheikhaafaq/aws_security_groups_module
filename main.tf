provider "aws" {
  region = "ap-south-1"
  #profile = "default"
}


module "security_groups" {
    count  = (var.create.security_groups == true ) ? 1 : 0
    source = "./security_groups"
    vpc_id = "vpc-0612a930b8d640d5c"
    security_group_configurations = var.security_group_configurations
}