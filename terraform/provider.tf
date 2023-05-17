terraform {
  cloud {
    organization = "kristenwyc"

    workspaces {
      name = "Cloud-Resume-Challenge-Backend"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.65.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
