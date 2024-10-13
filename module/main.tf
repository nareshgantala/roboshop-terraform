resource "aws_instance" "instance" {
  ami           = data.aws_ami.Centos8.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]

  tags = {
    Name = var.componenet_name
  }
}


resource "null_resource" "provisioner" {
  depends_on = [ aws_instance.frontend, aws_route53_record.frontend ]
  for_each = var.components
  provisioner "remote-exec" {
  
  connection {
    type     = "ssh"
    user     = "centos"
    password = "DevOps321"
    host     = aws_instance.instance.private_ip
  }
  
  inline = [
      "rm -rf roboshop-shell",
      "git clone https://github.com/nareshgantala/roboshop-shell.git ",
      "cd roboshop-shell",
      "sudo bash ${var.componenet_name}.sh ${var.password}
  ]
}
}


resource "aws_route53_record" "records" {
  zone_id = "Z008611913JO2PP72O804"
  name    = "${var.componenet_name}-dev.cloudlife.site"
  type    = "A"
  ttl     = 300
  records = [aws_instance.instance.private_ip]
}

