resource "aws_instance" "expense" {
  for_each = var.instances # this variable is map
  # for each will give us a special with name each
  ami                    = "ami-0220d79f3f480ecf5" # this AMI ID may change the over the time
  instance_type          = each.value
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

  tags = {
    Name = each.key
  }

}

resource "aws_security_group" "allow_ssh_terraform" {
  name        = "allow-ssh"
  description = "allow port number 22 for ssh access"

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