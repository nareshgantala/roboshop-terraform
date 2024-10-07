resource "aws_instance" "frontend" {
  ami           = "ami-0b4f379183e5706b9"
  instance_type = "t3.micro"

  tags = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z0795361K3CL8LSW1B54"
  name    = "frontend-dev.cloudlife.site"
  type    = "A"
  ttl     = 300
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "mongodb" {
  ami           = "ami-0b4f379183e5706b9"
  instance_type = "t3.micro"

  tags = {
    Name = "mongodb"
  }
}

resource "aws_route53_record" "mongodb" {
  zone_id = "Z0795361K3CL8LSW1B54"
  name    = "mongodb-dev.cloudlife.site"
  type    = "A"
  ttl     = 300
  records = [aws_instance.mongodb.private_ip]
}

resource "aws_instance" "mysql" {
  ami           = "ami-0b4f379183e5706b9"
  instance_type = "t3.micro"

  tags = {
    Name = "mysql"
  }
}

resource "aws_route53_record" "mysql" {
  zone_id = "Z0795361K3CL8LSW1B54"
  name    = "mysql-dev.cloudlife.site"
  type    = "A"
  ttl     = 300
  records = [aws_instance.mysql.private_ip]
}
resource "aws_instance" "payment" {
  ami           = "ami-0b4f379183e5706b9"
  instance_type = "t3.micro"

  tags = {
    Name = "payment"
  }
}

resource "aws_route53_record" "payment" {
  zone_id = "Z0795361K3CL8LSW1B54"
  name    = "payment-dev.cloudlife.site"
  type    = "A"
  ttl     = 300
  records = [aws_instance.payment.private_ip]
}

resource "aws_instance" "shipping" {
  ami           = "ami-0b4f379183e5706b9"
  instance_type = "t3.micro"

  tags = {
    Name = "shipping"
  }
}

resource "aws_route53_record" "shipping" {
  zone_id = "Z0795361K3CL8LSW1B54"
  name    = "shipping-dev.cloudlife.site"
  type    = "A"
  ttl     = 300
  records = [aws_instance.shipping.private_ip]
}

resource "aws_instance" "dispatch" {
  ami           = "ami-0b4f379183e5706b9"
  instance_type = "t3.micro"

  tags = {
    Name = "dispatch"
  }
}

resource "aws_route53_record" "dispatch" {
  zone_id = "Z0795361K3CL8LSW1B54"
  name    = "dispatch-dev.cloudlife.site"
  type    = "A"
  ttl     = 300
  records = [aws_instance.dispatch.private_ip]
}

resource "aws_instance" "cart" {
  ami           = "ami-0b4f379183e5706b9"
  instance_type = "t3.micro"

  tags = {
    Name = "cart"
  }
}

resource "aws_route53_record" "cart" {
  zone_id = "Z0795361K3CL8LSW1B54"
  name    = "cart-dev.cloudlife.site"
  type    = "A"
  ttl     = 300
  records = [aws_instance.cart.private_ip]
}

resource "aws_instance" "rabbitmq" {
  ami           = "ami-0b4f379183e5706b9"
  instance_type = "t3.micro"

  tags = {
    Name = "rabbitmq"
  }
}

resource "aws_route53_record" "rabbitmq" {
  zone_id = "Z0795361K3CL8LSW1B54"
  name    = "rabbitmq-dev.cloudlife.site"
  type    = "A"
  ttl     = 300
  records = [aws_instance.rabbitmq.private_ip]
}

resource "aws_instance" "user" {
  ami           = "ami-0b4f379183e5706b9"
  instance_type = "t3.micro"

  tags = {
    Name = "user"
  }
}

resource "aws_route53_record" "user" {
  zone_id = "Z0795361K3CL8LSW1B54"
  name    = "user-dev.cloudlife.site"
  type    = "A"
  ttl     = 300
  records = [aws_instance.user.private_ip]
}

resource "aws_instance" "catalogue" {
  ami           = "ami-0b4f379183e5706b9"
  instance_type = "t3.micro"

  tags = {
    Name = "catalogue"
  }
}

resource "aws_route53_record" "catalogue" {
  zone_id = "Z0795361K3CL8LSW1B54"
  name    = "catalogue-dev.cloudlife.site"
  type    = "A"
  ttl     = 300
  records = [aws_instance.catalogue.private_ip]
}

resource "aws_instance" "redis" {
  ami           = "ami-0b4f379183e5706b9"
  instance_type = "t3.micro"

  tags = {
    Name = "redis"
  }
}

resource "aws_route53_record" "redis" {
  zone_id = "Z0795361K3CL8LSW1B54"
  name    = "redis-dev.cloudlife.site"
  type    = "A"
  ttl     = 300
  records = [aws_instance.redis.private_ip]
}
