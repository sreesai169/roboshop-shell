
resource "aws_instance" "instance"{
  ami              =   data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]
  tags = {
    Name = local.name
  }
}
resource "null_resource" "provisioner"{
  count = var.provisioner ? 1 : 0
  depends_on = [aws_instance.instance,aws_route53_record.records]

  provisioner "remote-exec" {
    connection {
      type="ssh"
      user="root"
      password = "DevOps321"
      host = aws_instance.instance.private_ip
    }

    inline=[
      "rm -rf Roboshop-learn-shell",
      "git clone https://github.com/sreesai169/Roboshop-learn-shell.git",
      "cd Roboshop-learn-shell",
      "ls",
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
