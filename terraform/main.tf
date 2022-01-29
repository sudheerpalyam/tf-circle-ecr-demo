terraform {
  #   backend "local" {
  #     path = "terraform.tfstate"
  #   }
  backend "s3" {
    bucket = "sudheerpalyam-tfstate"
    key    = "sudheerpalyam-tf-circle-ecr-demo"
    region = "ap-southeast-2"
  }
  required_providers {
    circleci = {
      source  = "mrolla/circleci"
      version = "0.4.0"
    }
  }
}
provider "aws" {
  profile = "sudheerpalyam-iamadmin"
  region  = var.region
}

provider "circleci" {
  api_token    = var.circleci_cli_token
  organization = var.organization
}
