variable "security_group_configurations" {
    description = "All Security_Groups related configuration"
}

variable "create" {
  description = "Variable for creating selective services on eks['true' or 'flase']}"
}


variable "security_groups_rules_configurations" {
  description = "All Traffic via security group related configuration"
}