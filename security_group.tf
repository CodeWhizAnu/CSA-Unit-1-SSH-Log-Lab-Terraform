# Use the account's default VPC, same as the console default when launching
# an instance with "No preference (Default subnet in any availability zone)".
data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "ssh_log_lab" {
  name        = "ssh-log-lab-sg"
  description = "Intentionally open SSH+HTTP for the internet-facing scanning lab"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "SSH from the entire internet (lab requirement)"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP from the entire internet (lab requirement)"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "ssh-log-lab-sg"
    Purpose = "Cloud-Security-Unit1-Alternate-Task"
  }
}
