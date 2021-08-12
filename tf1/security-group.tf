resource "aws_security_group" "project1-sg" {
  vpc_id                 = var.vpc_id

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 23
    protocol    = "tcp"
    to_port     = 22
  }
}

