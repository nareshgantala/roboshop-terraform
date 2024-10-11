data "aws_ami" "Centos8" {
  most_recent      = true
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["Centos-8-DevOps-Practice"]
  }
}



data "aws_security_group" "allow-all" {
  name = "allow-all"
}

