resource "aws_instance" "this" { # this name related to terraform
  ami                    = var.ami_id
  instance_type          = var.environment == "prod" ? "t3.small" : "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id] # in the documentation this is list thats why we used [] brackets vpc_security_group_ids = [aws_security_group.test.id] m
  tags                   = var.ec2_tags                      #tags is map and flower braces of data type is alwaysmap





}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  ingress {
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = var.sg_tags
}


#lift side things words are terrafrom names in documentation not be changed.