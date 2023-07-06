
resource "aws_instance" "instance"{
  for_each = var.component
  ami              =   data.aws_ami.centos.image_id
  instance_type = each.value["instance_type"]
  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]
  tags = { Name = var.component_name}
}
resource "null_resource" "provisioner"{
  depends_on = [aws_instance.instance,aws_route53_record.records]

  provisioner "remote-exec" {
    connection {
      type="ssh"
      user="root"
      password = "DevOps321"
      host = aws_instance.instance.private_ip
    }

    inline=[
      "rm -rf roboshop-shell",
      "git clone https://github.com/sreesai169/Roboshop-learn-shell.git",
      "cd roboshop-shell",
      "bash ${var.component_name}.sh ${var.password}"
    ]
  }
}
resource "aws_route53_record" "records"{
  name    = "${var.component_name}-dev.devops16.online"
  type    = "A"
  zone_id = "Z051652936LR0CPQEANRY"
  ttl = 30
  records =[aws_instance.instance.private_ip]
}
