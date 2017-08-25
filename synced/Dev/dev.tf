provider "aws" {
  region                  = "eu-central-1"
  shared_credentials_file = "/home/ubuntu/.aws/credentials"
  profile                 = "dev"
  version                 = "~> 0.1"
}

module "base"   {
  source = "../Base"
}
