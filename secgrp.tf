resource "aws_security_group" "dove_sg" {
    name        = "dove-sg"
  description = "Sec Group  for Dove  ssh"
  vpc_id      = aws_vpc.dove.id

  tags = {
    Name = "allow_ssh"
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.MYIP]
  }
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}