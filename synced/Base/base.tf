provider "aws" {
  region                  = "eu-central-1"
  shared_credentials_file = "/home/ubuntu/.aws/credentials"
  profile                 = "dev"
  version                 = "~> 0.1"
}

resource "aws_instance" "ob_example_1" {
  ami = "ami-1e339e71"
  instance_type = "t2.micro"
  tags {
    name = "${var.ob_server_name}",
    use  = "An AWS instance created as example"
  }
}
