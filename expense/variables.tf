variable "instance_names" {
    type = list(string)
    default = ["mysql", "backend", "frontend"]

}

variable "comman_tags" {
    type = map
    default = {
        project     = "expense"
        Environment = "dev"
        Terraform   = "true"
    }
}

variable "zone_id" { # here we should take from r53 hosted zone
    default = "Z02579582QF6L8MOAFJQP"

}

variable "domain_name" {
    default = "daws81.online"
}