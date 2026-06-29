variable instance_names {
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