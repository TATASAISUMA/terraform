resource "aws_instance" "expense" { # this name related to terraform
count=3
  ami                    = "ami-05fa46471b02db0ce"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id] # in the documentation this is list thats why we used [] brackets vpc_security_group_ids = [aws_security_group.test.id] m
  tags = {
    Name    = var.instances[count.index]
    purpose = "terraform-practise"
  } #tags is map and flower braces of data type is alwaysmap
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  ingress {
    from_port   = 22
    to_port     = 22
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
    Name = "allow-tls"
  }
}


#lift side things words are terrafrom names in documentation not be changed.
# count= If you want same instance 40 menas copy and paste is not a right way so, we are giving count=3 like that