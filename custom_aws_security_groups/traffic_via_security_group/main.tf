# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule
resource "aws_security_group_rule" "allow_via_security_group" {
  for_each = var.security_groups_rules_conf.rules
  type              = each.value.type
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  source_security_group_id = data.aws_security_group.source_sg[each.key].id
  from_port         = each.value.from_port
  security_group_id = data.aws_security_group.main[each.key].id
}

# Data Source source security groups
data "aws_security_group" "source_sg" {
  for_each =  var.security_groups_rules_conf.rules
  tags = each.value.source_security_group_tags
}

# Data Source main security group
data "aws_security_group" "main" {
  for_each = var.security_groups_rules_conf.rules
  tags = each.value.security_group_tags
}