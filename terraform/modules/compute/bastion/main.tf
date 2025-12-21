data "local_file" "ssh_public_key" {
  filename = var.ssh_public_key_path
}

# Creates an SSH key from the host to connect to the bastion
resource "aws_key_pair" "bastion_ssh_key" {
  key_name   = data.local_file.ssh_public_key.filename
  public_key = data.local_file.ssh_public_key.content
}

# Create the ec2 instance
resource "aws_instance" "bastion" {
  ami                         = "ami-0025f8382ce566ead" # AWS linux 2
  instance_type               = "t3.micro"              # Enough just to ssh
  key_name                    = data.local_file.ssh_public_key.filename
  subnet_id                   = var.public_subnet_id
  associate_public_ip_address = true

  root_block_device {
    volume_size = "4"
    volume_type = "gp3"
  }

  tags = {
    Name = "${var.environment}-bastion"
  }

  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
}

resource "aws_security_group" "bastion_sg" {
  name   = "bastion_sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.maintainer_ip == "" ? ["0.0.0.0/0"] : [var.maintainer_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.maintainer_ip == "" ? ["0.0.0.0/0"] : [var.maintainer_ip]
  }
}

