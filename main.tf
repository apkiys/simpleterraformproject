provider "aws" {
  region = "ap-southeast-1"
}

data "aws_security_group" "EC2_Security_Group" {
  id = "sg-0990d38bb26cf4c67"
}

resource "aws_instance" "webserver" {
  ami           = "ami-0c91f4476780c2eaf"
  count         = 2
  instance_type = "t2.micro"
  key_name      = "EC2_Keypair"
  availability_zone = "ap-southeast-1a"
  associate_public_ip_address = true
  subnet_id     = "subnet-0dfea84d2115c6cb5"
  vpc_security_group_ids = [data.aws_security_group.EC2_Security_Group.id]
  
  tags = {
    Name = "Webserver-${count.index + 1}"
  }
}

resource "aws_instance" "ansibleserver" {
  ami           = "ami-0c91f4476780c2eaf"
  count         = 1
  instance_type = "t2.micro"
  key_name      = "EC2_Keypair"
  availability_zone = "ap-southeast-1a"
  associate_public_ip_address = true
  subnet_id     = "subnet-0dfea84d2115c6cb5"
  vpc_security_group_ids = [data.aws_security_group.EC2_Security_Group.id]
  user_data = <<-EOL
  #!/bin/bash
  sudo yum update -y
  sudo yum install pip -y
  sudo python3 -m pip install --user ansible
  EOL

  tags = {
    Name = "Ansibleserver"
  }
}