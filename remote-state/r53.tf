resource "aws_route53_record" "expense" {
  count   = length(var.instance_names)
  zone_id = local.zone_id
  name    = var.instance_names[count.index] == "frontend" ? local.domain_name : "${var.instance_names[count.index]}.${local.domain_name}" # "${var.instance_names[count.index]}.${local.domain_name}" uses string interpolation. It combines two variables—var.instance_names[count.index] and local.domain_name—to construct a single string using "."

  type = "A"
  ttl  = 1

  records = var.instance_names[count.index] == "frontend" ? [aws_instance.terraform[count.index].public_ip] : [aws_instance.terraform[count.index].private_ip]

  allow_overwrite = true

}