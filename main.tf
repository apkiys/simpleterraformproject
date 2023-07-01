provider "aws" {
  region = "ap-southeast-1"
  }

resource "aws_instance" "instances" {
  ami           = "ami-08928044842b396f0"
  instance_type = "t2.micro"
  count         = 1

  tags = {
    Name = "Webserver-${count.index + 1}-Test"
  }
}