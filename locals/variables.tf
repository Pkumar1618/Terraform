variable "instance_names" {
  type    = list(string)
  default = ["mysql", "backend", "frontend"]
}

variable "environment" {
    default = "prod"
}
# variable "domain_name" {
#     default = "daws81.online"
# }

# variable "zone_id" {
#     default = "Z02579582QF6L8MOAFJQP"
# }