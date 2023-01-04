provider "aws" {
  region = "ap-south-1"
  #profile = "default"
}

module "security_groups" {
    count  = (var.create.security_groups == true ) ? 1 : 0
    source = "./custom_aws_security_groups/security_groups"
    vpc_id = "vpc-0612a930b8d640d5c"
    security_group_configurations = var.security_group_configurations
}

module "traffic_via_security_group" {
  depends_on = [
    module.security_groups
  ]
  count = (var.create.security_groups_rules == true ) ? 1 : 0
  source = "./custom_aws_security_groups/traffic_via_security_group"
  security_groups_rules_conf = var.security_groups_rules_configurations
}

