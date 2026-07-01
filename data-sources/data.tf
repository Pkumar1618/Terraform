data "aws_ami" "prashanth" {

    most_recent   = true
    owners = ["113461833008"]

    filter {
        name   = "name"
        values = ["RHEL-9-DevOps-practice"]
    }

    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

}