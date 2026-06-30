resource "aws_instance" "backend" {
    count = 3 # it means create the 3 instances.
    ami      = "ami-0220d79f3f480ecf5"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

    tags = {
        Name = var.instance_names[count.index] # In Terraform, count.index is used to identify the index number of the current resource instance when you create multiple resources using the count meta-argument.
    }
}

resource "aws_security_group" "allow_ssh_terraform" {

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

    tags = {
        Name = "allow-ssh"
    }
}