provider "aws" {
  region = "eu-central-1"
}

terraform {

  cloud {
    organization = "olexiy"

    workspaces {
      name = "private-examples"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.37.0"
    }
  }
}