terraform {
  required_providers {
    ansible = {
      source  = "nbering/ansible"
      version = "1.0.4"
    }
    # saltstack = {
    #   source  = "mt5225/saltstack"
    #   version = "1.0.4"
    # }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
