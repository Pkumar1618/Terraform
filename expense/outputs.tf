# use output.instance_info
# output.instance_info == aws_instance.expense

output "instances_info" {
  value = aws_instance.expense
}