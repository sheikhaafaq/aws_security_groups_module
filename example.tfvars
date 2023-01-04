create = {
    security_groups = true
    security_groups_rules = true
}

# All security groups configuration
security_group_configurations = {
    security_groups = {
#--------------------->>  Security Group 0  <-------------------------------------------
        "0" = { 
            name        = "security_group_0"
            description = "security_group_0"
            # Ingress Rules
            ingress_rules = {
                # Ingress Rule 0
                0 = {
                    description      = "TLS from Public Internet"
                    from_port        = 443
                    to_port          = 443
                    protocol         = "tcp"
                    cidr_blocks      = ["0.0.0.0/0"]
                    # ipv6_cidr_blocks = ["::/0"]  #Optional 
                    
                },
                # Ingress Rule 1
                1 = {
                    description      = "SSH from Public Internet"
                    from_port        = 22
                    to_port          = 22
                    protocol         = "tcp"
                    cidr_blocks      = ["0.0.0.0/0"]
                    # ipv6_cidr_blocks = ["::/0"] #Optional 
                   
                },
            }
            # Egress Rules
            egress_rules =  {
                # Egress Rule 0
                0 = {
                    description      = "Allow all traffic to outside"
                    from_port        = 0
                    to_port          = 0
                    protocol         = "-1"
                    cidr_blocks      = ["0.0.0.0/0"]
                    # ipv6_cidr_blocks = ["::/0"]  #Optional
                  
                },
                # Egress Rule 1
                ##############
            }
            # Tags for Security Group 0
            tags = {
                Name = "security_group_0"
            } 
        },
# #--------------------->>  Security Group 1  <-------------------------------------------
        "1" = { 
            name        = "security_group_1"
            description = "security_group_1"
            # Ingress Rules
            ingress_rules = {
                # Ingress Rule 0
                0 = {
                    description      = "TLS from Public Internet"
                    from_port        = 443
                    to_port          = 443
                    protocol         = "tcp"
                    cidr_blocks      = []
                    #ipv6_cidr_blocks = ["::/0"]  #Optional 
                },
                # Ingress Rule 1
                1 = {
                    description      = "SSH from Public Internet"
                    from_port        = 22
                    to_port          = 22
                    protocol         = "tcp"
                    cidr_blocks      = ["0.0.0.0/0"]
                    #ipv6_cidr_blocks = ["::/0"]   #Optional
                    
                },
            }
            # Egress Rules
            egress_rules =  {
                # Egress Rule 0
                0 = {
                    description      = "Allow all traffic to outside"
                    from_port        = 0
                    to_port          = 0
                    protocol         = "-1"
                    cidr_blocks      = ["0.0.0.0/0"]
                    #ipv6_cidr_blocks = ["::/0"] #Optional 
                },
                # Egress Rule 1
                ####
                ####
            }
            # Tags for Security Group 1
            tags = {
                Name = "security_group_1"
            }
        }
#--------------------->>  Security Group 2  <-------------------------------------------
#######
#######
    }
}



# Security groups rules that allow traffic via security group
security_groups_rules_configurations = {
    rules = {
        # This rule adds an inbound rule to security group 'Name = "security_group_0"'
        # that allows all traffic from Name = "security_group_1"
        0 = {
            type              = "ingress"
            to_port           = "0"
            protocol          = "-1"
            source_security_group_tags = {
                Name = "security_group_1"
            }
            from_port         = "0"
            security_group_tags = {
                Name = "security_group_0"
            }
        },

        #Similarly you can add multiple rules here.

    }
}