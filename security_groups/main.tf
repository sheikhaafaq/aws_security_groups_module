resource "aws_security_group" "security-groups" {
  # Dynamic number of Security Groups 
  for_each = var.security_group_configurations.security_groups
  name        = each.value.name
  description = each.value.description
  vpc_id      = var.vpc_id

  # Dynamic number of Ingress Rules
  dynamic ingress {
    for_each = var.security_group_configurations.security_groups[each.key].ingress_rules
    content {
      description      = ingress.value.description  #Here the 'igress' is the name dynamic egress block
      from_port        = ingress.value.from_port
      to_port          = ingress.value.to_port
      protocol         = ingress.value.protocol
      cidr_blocks      = lookup(ingress.value, "cidr_blocks", null)
      ipv6_cidr_blocks = lookup(ingress.value, "ipv6_cidr_blocks", null)
      security_groups  = lookup(ingress.value, "security_groups", null)
    }
    
  }

  # Dynamic number of Egress Rules
  dynamic egress {
    for_each = var.security_group_configurations.security_groups[each.key].egress_rules
    content {
      description      = egress.value.description  #Here the 'egress' is the name dynamic egress block
      from_port        = egress.value.from_port
      to_port          = egress.value.to_port
      protocol         = egress.value.protocol
      cidr_blocks      = lookup(ingress.value, "cidr_blocks", null)
      ipv6_cidr_blocks = lookup(ingress.value, "ipv6_cidr_blocks", null)
      security_groups  = lookup(ingress.value, "security_groups", null)
    }
  }

  tags = each.value.tags
}
