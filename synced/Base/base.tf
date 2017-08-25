
resource "aws_instance" "ob_example_1" {
  ami = "ami-1e339e71"
  instance_type = "t2.micro"
  tags {
    name = "${var.ob_server_name}",
    use  = "An AWS instance created as example"
  }
}
