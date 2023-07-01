provider "aws" {
  region = "ap-southeast-1"
  }

resource "aws_instance" "instances" {
  ami           = "ami-013bdaf9892a21e7e"
  instance_type = "t2.micro"
  count         = 2

  tags = {
    Name = "Webserver-${count.index + 1}"
  }
}