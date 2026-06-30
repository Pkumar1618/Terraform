resource "aws_instance" "backend" {
    count = length(var.instance_names) # here In variables we have give 3 instances but if we give 30 also using through length function it will create.
    ami  = "ami-0220d79f3f480ecf5"
    instance_type = "t3.micro"
    vpc_security_group_ids  = [aws_security_group.allow_ssh_terraform.id]
    # tags = {
    #     Name = var.instance_names[count.index]
    # }

    tags = merge (  # here we are merging the instance names.
        var.comman_tags,
        {
            Name = var.instance_names[count.index]
        }


    ) 

}

resource "aws_security_group" "allow_ssh_terraform" {
    name       = "allow-ssh"
    description = "Allow Port number 22 for SSH access"

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = merge (  # here we are merging the instance names.
        var.comman_tags,
        { # this map that's we are using currle brases.
            Name = "allow-ssh"
        }


    ) 
}

