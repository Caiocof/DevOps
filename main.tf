terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.64.0"
    }
  }
  backend "s3" {
    bucket = "caiocof-bucket-state"
    key    = "caiocof-pipeline-github/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      owner      = "caio.fonse"
      managed-by = "terraform"
    }
  }
}

data "terraform_remote_state" "remote_vpc" {
  backend = "s3"

  config = {
    bucket = "caiocof-bucket-state"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-1"

  }


}

