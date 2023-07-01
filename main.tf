provider "aws" {
  region = "ap-southeast-1"
  }

resource "aws_instance" "instances" {
  ami           = "ami-0c91f4476780c2eaf"
  instance_type = "t2.micro"
  count         = 1

  tags = {
    Name = "Webserver-${count.index + 1}-Test"
  }
}