create = {
    security_groups = true
}


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
                    ipv6_cidr_blocks = ["::/0"]  #Optional 
                    #security_groups  = ["sg-0a6e0e87b17d914be"]
                },
                # Ingress Rule 1
                1 = {
                    description      = "SSH from Public Internet"
                    from_port        = 22
                    to_port          = 22
                    protocol         = "tcp"
                    cidr_blocks      = ["0.0.0.0/0"]
                    ipv6_cidr_blocks = ["::/0"] #Optional 
                    #security_groups  = ["sg-0a6e0e87b17d914be"]
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
                    ipv6_cidr_blocks = ["::/0"]  #Optional
                    #security_groups  = ["sg-0a6e0e87b17d914be"] 
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
                    security_groups  = ["sg-0a6e0e87b17d914be"]
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
                    security_groups  = ["sg-0a6e0e87b17d914be"] 
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
# #--------------------->>  Security Group 2  <-------------------------------------------
# #######
# #######
    }

}