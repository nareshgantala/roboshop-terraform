data "aws_ami" "Centos8" {
  most_recent      = true
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["Centos-8-DevOps-Practice"]
  }
}

variable "instance_type" {
  default = "t3.small"
}

variable "instances" {
  default = [ "frontend", "mongodb", "payment", "user", "shipping", "dispatch", "catalogue", "mysql", "rabbitmq", "cart", "redis" ]
}

data "aws_security_group" "allow-all" {
  name = "allow-all"
}


resource "aws_instance" "frontend" {
  count = length(var.instances)
  ami           = data.aws_ami.Centos8.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]

  tags = {
    Name = var.instances[count.index]
  }
}

resource "aws_route53_record" "Route53" {
  count = length(var.instances)
  zone_id = "Z0795361K3CL8LSW1B54"
  name    = "${var.instances}[count.index]-dev.cloudlife.site"
  type    = "A"
  ttl     = 300
  records = [aws_instance.frontend.private_ip]
}

# resource "aws_instance" "mongodb" {
#   ami           = data.aws_ami.Centos8.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [data.aws_security_group.allow-all.id]

#   tags = {
#     Name = "mongodb"
#   }
# }

# resource "aws_route53_record" "mongodb" {
#   zone_id = "Z0795361K3CL8LSW1B54"
#   name    = "mongodb-dev.cloudlife.site"
#   type    = "A"
#   ttl     = 300
#   records = [aws_instance.mongodb.private_ip]
# }

# resource "aws_instance" "mysql" {
#   ami           = data.aws_ami.Centos8.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [data.aws_security_group.allow-all.id]

#   tags = {
#     Name = "mysql"
#   }
# }

# resource "aws_route53_record" "mysql" {
#   zone_id = "Z0795361K3CL8LSW1B54"
#   name    = "mysql-dev.cloudlife.site"
#   type    = "A"
#   ttl     = 300
#   records = [aws_instance.mysql.private_ip]
# }
# resource "aws_instance" "payment" {
#   ami           = data.aws_ami.Centos8.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [data.aws_security_group.allow-all.id]

#   tags = {
#     Name = "payment"
#   }
# }

# resource "aws_route53_record" "payment" {
#   zone_id = "Z0795361K3CL8LSW1B54"
#   name    = "payment-dev.cloudlife.site"
#   type    = "A"
#   ttl     = 300
#   records = [aws_instance.payment.private_ip]
# }

# resource "aws_instance" "shipping" {
#   ami           = data.aws_ami.Centos8.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [data.aws_security_group.allow-all.id]

#   tags = {
#     Name = "shipping"
#   }
# }

# resource "aws_route53_record" "shipping" {
#   zone_id = "Z0795361K3CL8LSW1B54"
#   name    = "shipping-dev.cloudlife.site"
#   type    = "A"
#   ttl     = 300
#   records = [aws_instance.shipping.private_ip]
# }

# resource "aws_instance" "dispatch" {
#   ami           = data.aws_ami.Centos8.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [data.aws_security_group.allow-all.id]

#   tags = {
#     Name = "dispatch"
#   }
# }

# resource "aws_route53_record" "dispatch" {
#   zone_id = "Z0795361K3CL8LSW1B54"
#   name    = "dispatch-dev.cloudlife.site"
#   type    = "A"
#   ttl     = 300
#   records = [aws_instance.dispatch.private_ip]
# }

# resource "aws_instance" "cart" {
#   ami           = data.aws_ami.Centos8.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [data.aws_security_group.allow-all.id]

#   tags = {
#     Name = "cart"
#   }
# }

# resource "aws_route53_record" "cart" {
#   zone_id = "Z0795361K3CL8LSW1B54"
#   name    = "cart-dev.cloudlife.site"
#   type    = "A"
#   ttl     = 300
#   records = [aws_instance.cart.private_ip]
# }

# resource "aws_instance" "rabbitmq" {
#   ami           = data.aws_ami.Centos8.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [data.aws_security_group.allow-all.id]

#   tags = {
#     Name = "rabbitmq"
#   }
# }

# resource "aws_route53_record" "rabbitmq" {
#   zone_id = "Z0795361K3CL8LSW1B54"
#   name    = "rabbitmq-dev.cloudlife.site"
#   type    = "A"
#   ttl     = 300
#   records = [aws_instance.rabbitmq.private_ip]
# }

# resource "aws_instance" "user" {
#   ami           = data.aws_ami.Centos8.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [data.aws_security_group.allow-all.id]

#   tags = {
#     Name = "user"
#   }
# }

# resource "aws_route53_record" "user" {
#   zone_id = "Z0795361K3CL8LSW1B54"
#   name    = "user-dev.cloudlife.site"
#   type    = "A"
#   ttl     = 300
#   records = [aws_instance.user.private_ip]
# }

# resource "aws_instance" "catalogue" {
#   ami           = data.aws_ami.Centos8.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [data.aws_security_group.allow-all.id]

#   tags = {
#     Name = "catalogue"
#   }
# }

# resource "aws_route53_record" "catalogue" {
#   zone_id = "Z0795361K3CL8LSW1B54"
#   name    = "catalogue-dev.cloudlife.site"
#   type    = "A"
#   ttl     = 300
#   records = [aws_instance.catalogue.private_ip]
# }

# resource "aws_instance" "redis" {
#   ami           = data.aws_ami.Centos8.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [data.aws_security_group.allow-all.id]

#   tags = {
#     Name = "redis"
#   }
# }

# resource "aws_route53_record" "redis" {
#   zone_id = "Z0795361K3CL8LSW1B54"
#   name    = "redis-dev.cloudlife.site"
#   type    = "A"
#   ttl     = 300
#   records = [aws_instance.redis.private_ip]
# }
