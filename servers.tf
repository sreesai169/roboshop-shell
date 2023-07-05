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
#resource "aws_instance" "frontend" {
#
#  ami              =   data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]
#  tags = { Name = "frontend" }
#}
#resource "aws_route53_record""frontend"{
#
#  name    = "frontend-dev.devops16.online"
#  type    = "A"
#  zone_id = "Z051652936LR0CPQEANRY"
#  ttl = 30
#  records =[aws_instance.frontend.public_ip]
#}
#resource "aws_instance" "mongodb" {
#  ami              =   data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]
#  tags = { Name = "mongodb" }
#}
#resource "aws_route53_record""mongodb"{
#
#  name    = "mongodb-dev.devops16.online"
#  type    = "A"
#  zone_id = "Z051652936LR0CPQEANRY"
#  ttl = 30
#  records =[aws_instance.mongodb.public_ip]
#}
#resource "aws_instance" "catalogue" {
#  ami              =   data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]
#  tags = { Name = "catalogue" }
#}
#
#resource "aws_route53_record""catalogue"{
#
#  name    = "catalogue-dev.devops16.online"
#  type    = "A"
#  zone_id = "Z051652936LR0CPQEANRY"
#  ttl = 30
#  records =[aws_instance.catalogue.public_ip]
#}
#resource "aws_instance" "redis" {
#  ami              =   data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]
#  tags = { Name = "redis" }
#}
#
#resource "aws_route53_record""redis"{
#
#  name    = "redis-dev.devops16.online"
#  type    = "A"
#  zone_id = "Z051652936LR0CPQEANRY"
#  ttl = 30
#  records =[aws_instance.redis.public_ip]
#}
#resource "aws_instance" "user" {
#  ami              =   data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]
#  tags = { Name = "user" }
#}
#
#resource "aws_route53_record""user"{
#
#  name    = "user-dev.devops16.online"
#  type    = "A"
#  zone_id = "Z051652936LR0CPQEANRY"
#  ttl = 30
#  records =[aws_instance.user.public_ip]
#}
#resource "aws_instance" "cart" {
#  ami              =   data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]
#  tags = { Name = "cart" }
#}
#
#resource "aws_route53_record""cart"{
#
#  name    = "cart-dev.devops16.online"
#  type    = "A"
#  zone_id = "Z051652936LR0CPQEANRY"
#  ttl = 30
#  records =[aws_instance.cart.public_ip]
#}
#resource "aws_instance" "mysql" {
#  ami              =   data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]
#  tags = { Name = "mysql" }
#}
#
#resource "aws_route53_record""mysql"{
#
#  name    = "mysql-dev.devops16.online"
#  type    = "A"
#  zone_id = "Z051652936LR0CPQEANRY"
#  ttl = 30
#  records =[aws_instance.mysql.public_ip]
#}
#resource "aws_instance" "shipping" {
#  ami              =   data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]
#  tags = { Name = "shipping" }
#}
#resource "aws_route53_record""shipping"{
#
#  name    = "shipping-dev.devops16.online"
#  type    = "A"
#  zone_id = "Z051652936LR0CPQEANRY"
#  ttl = 30
#  records =[aws_instance.shipping.public_ip]
#}
#resource "aws_instance" "rabbitmq" {
#  ami              =   data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]
#  tags = { Name = "rabbitmq" }
#}
#resource "aws_route53_record""rabbitmq"{
#
#  name    = "rabbitmq-dev.devops16.online"
#  type    = "A"
#  zone_id = "Z051652936LR0CPQEANRY"
#  ttl = 30
#  records =[aws_instance.rabbitmq.public_ip]
#}
#resource "aws_instance" "payment" {
#  ami              =   data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]
#  tags = { Name = "payment" }
#}
#
#resource "aws_route53_record""payment"{
#
#  name    = "payment-dev.devops16.online"
#  type    = "A"
#  zone_id = "Z051652936LR0CPQEANRY"
#  ttl = 30
#  records =[aws_instance.payment.public_ip]
#}