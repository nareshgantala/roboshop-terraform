
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

provisioner "remote-exec" {
  
  connection {
    type     = "ssh"
    user     = "centos"
    password = "DevOps321"
    host     = self.private_ip
  }
  
  inline = [
      "rm -rf roboshop-shell",
      "git clone https://github.com/nareshgantala/roboshop-shell.git ",
      "cd roboshop-shell",
      "sudo bash ${each.value["name"]}.sh"
  ]
}

resource "aws_route53_record" "frontend" {
  for_each = var.components
  zone_id = "Z0807971R0XGYSVV8ZBE"
  name    = "${each.value["name"]}-dev.cloudlife.site"
  type    = "A"
  ttl     = 300
  records = [aws_instance.frontend[each.value["name"]].private_ip]
}

