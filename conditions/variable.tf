variable "ami_id" {
  type        = string #this is not necesary but if you give means it would be better
  default     = "ami-05fa46471b02db0ce"
  description = "this is rhel ami id"
}

variable "environment" {
  default = "prod"
}

variable "instance_type" {
  default = "t3.micro"
}
variable "ec2_tags" {
  type = map(any)
  default = {
    Name        = "expense-backend-dev" # this one is related to  our end in console
    project     = "ecpense"
    component   = "backend"
    environment = "dev"
  }
}

variable "from_port" {
  type    = number
  default = 22
}
variable "to_port" {
  type    = number
  default = 22
}
variable "cidr_blocks" {
  type    = list(any) #or list(string)
  default = ["0.0.0.0/0"]
}
variable "sg_tags" {
  type = map(any) #or list(map)
  default = {

    Name = "expense-backend-dev"
  }
}



#variable names is you can give any thing your wish