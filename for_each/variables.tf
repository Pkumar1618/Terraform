variable "instances" {
  type = map(any)
  default = {
    mysql    = "t3.small"
    backend  = "t3.micro"
    frontend = "t3.micro"
  }
}

variable "domain_name" {
  default = "daws81.online"

}

variable "zone_id" {
  default = "Z02579582QF6L8MOAFJQP"
}