data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

resource "aws_instance" "ssh_log_lab" {
  ami                         = data.aws_ami.amazon_linux_2023.id
  instance_type               = var.instance_type
  key_name                    = var.key_pair_name
  vpc_security_group_ids      = [aws_security_group.ssh_log_lab.id]
  associate_public_ip_address = true

  tags = {
    Name    = var.instance_name
    Purpose = "Cloud-Security-Unit1-Alternate-Task"
  }
}
