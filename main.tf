provider "aws" {
  region = "ap-northeast-3"
  # Edit below
  }

resource "aws_instance" "instances" {
  ami           = "ami-013bdaf9892a21e7e"
  instance_type = "t2.micro"
  key_name = "Webserver_Keypair"
  availability_zone = "${AWS::Region}a"
  count         = 2

  tags = {
    Name = "Webserver-${count.index + 1}-Chris"
  }
}