
resource "aws_instance" "frontend" {
  # count = length(var.instances)
  for_each = var.components
  ami           = data.aws_ami.Centos8.image_id
  instance_type = each.value["instance_type"]
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]

  tags = {
    Name = each.value["name"]
  }
}

resource "aws_route53_record" "frontend" {
  for_each = var.components
  zone_id = "Z00869473CSG2NBMF0Y2X"
  name    = "${each.value["name"]}-dev.cloudlife.site"
  type    = "A"
  ttl     = 300
  records = [aws_instance.frontend[each.value["name"]].private_ip]
}

