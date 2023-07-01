provider "aws" {
  region = "ap-northeast-3"
  # Edit below
  access_key = "AKIATXF4JQPH72SRLNHF"
  secret_key = "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"
  }

resource "aws_instance" "instances" {
  ami           = "ami-013bdaf9892a21e7e"  # Amazon Linux 2 LTS
  instance_type = "t2.micro"
  count         = 2

  tags = {
    Name = "Webserver-${count.index + 1}-Chris"
  }
}