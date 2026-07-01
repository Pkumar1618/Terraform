terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.52.0"

    }
  }

}
provider "aws" {
  # configuration is optional
  region = "us-east-1"
}