resource "null_resource" "test" {
  count = 2
}

resource "null_resource" "test1" {
  for_each = var.colors
}

variable "colors" {
  default = {
    red = 31
    green = 32
    yellow = 33
    blue = 34
    magenta = 35
    cyan = 36
  }
}

resource "aws_instance" "frontend" {
  for_each      = var.instance_types
  ami           = var.ami
  instance_type = var.instance_types["instance_type"]
  tags = {
    Name = each.key
  }
}
variable "ami" {}

variable "instance_types" {
  default = {

    frontend = {
      instance_type = ""
    }

    mysql = {
      instance_type = ""
    }

    backend = {
      instance_type = ""
    }
  }
}