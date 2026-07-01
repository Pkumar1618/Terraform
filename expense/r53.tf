resource "aws_route53_record" "expense" {
  count           = length(var.instance_names)
  zone_id         = var.zone_id
  name            = "${var.instance_names[count.index]}.${var.domain_name}"
  type            = "A"
  ttl             = 1
  allow_overwrite = true

  records = [
    aws_instance.expense[count.index].private_ip 
  ] # this is list type that is reson we have given to count.index.
}