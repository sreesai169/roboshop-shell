data "aws_ami""centos"{
  owners = ["973714476881"]
  most_recent = true
  name_regex = "Centos-8-DevOps-Practice"
}
variable "instance_type" {
  default = "t3.small"
}
data "aws_security_group" "allow-all"{
  name ="allow-all"
}
variable "component" {
 default = {
   frontend = {
     name = "frontend"
     instance_type = "t3.small"
   }
   mongodb={
     name = "mongodb"
     instance_type = "t3.small"
   }
   catalogue = {
     name = "catalogue"
     instance_type = "t3.micro"
   }
   redis = {
     name = "redis"
     instance_type = "t3.small"
   }
   user = {
     name = "user"
     instance_type = "t3.micro"
   }
   cart = {
     name = "cart"
     instance_type = "t3.micro"
   }
   mysql = {
     name = "mysql"
     instance_type = "t3.small"
   }
   shipping = {
     name = "shipping"
     instance_type = "t3.medium"
   }
   rabbitmq = {
     name = "rabbitmq"
     instance_type = "t3.small"
   }
   payment = {
     name = "payment"
     instance_type = "t3.small"
   }
 }
}
resource "aws_instance""instance"{
  for_each = var.component
  ami              =   data.aws_ami.centos.image_id
  instance_type = each.value["instance_type"]
  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]
  tags = { Name = each.value["name"]}
}
resource "aws_route53_record""records"{
  for_each = var.component
  name    = "${each.value["name"]}-dev.devops16.online"
  type    = "A"
  zone_id = "Z051652936LR0CPQEANRY"
  ttl = 30
  records =[aws_instance.instance[each.value["name"]].private_ip]
}
