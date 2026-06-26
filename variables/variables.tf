# varible prefernces.
# 1. command line
# 2. terraform.tfvars
# 3. Environment variable  # export TF_VAR_your_variable_name
# 4. default
# 5. prompt
variable "ami_id" {
  type        = string
  default     = "ami-0220d79f3f480ecf5"
  description = "This the AMI ID of devops-practice which is RHEL-9"
}

variable "instance_type" {
    type      = string
    default   = "t3.micro"
}

variable "tags" {
    type    = map # optional
    default = {
        Name = "backend"
        Project = "expense"
        Component = "backend"
        Environment = "DEV"
        Terraform   = "true"
    }
}

variable "sg_name" {
        type    = string
        default = "allow-ssh"
}

variable "sg_description" {
        type    = string
        default = "allow port number 22 for ssh access"
}

variable "from_port" {
        type    = number
        default = 22
}

variable "to_port" {
        type    = number
        default = 22
}

variable "protocol" {
        type    = string
        default = "tcp"
}

variable "ingress_cidr" {
        type    = list(string)
        default = ["0.0.0.0/0"]
}