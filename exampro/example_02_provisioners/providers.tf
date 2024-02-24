provider "aws" {
}

terraform {
  cloud {
    organization = "olexiy"

    workspaces {
      name = "provisioners"
    }

  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.37.0"
    }
  }
}