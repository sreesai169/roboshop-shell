data "aws_ami""centos"{
  owners = ["973714476881"]
  most_recent = true
  name_regex = "Centos-8-DevOps-Practice"
}


resource "aws_instance" "frontend" {
  ami              =   data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = { Name = "frontend" }
}
resource "aws_route53_record""frontend"{

  name    = "frontend-dev.devops16.online"
  type    = "A"
  zone_id = "Z051652936LR0CPQEANRY"
  ttl = 30
  records =[aws_instance.frontend.public_ip]
}
resource "aws_instance" "mongodb" {
  ami              =   data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = { Name = "mongodb" }
}
resource "aws_route53_record""mongodb"{

  name    = "mongodb-dev.devops16.online"
  type    = "A"
  zone_id = "Z051652936LR0CPQEANRY"
  ttl = 30
  records =[aws_instance.mongodb.public_ip]
}
resource "aws_instance" "catalogue" {
  ami              =   data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = { Name = "catalogue" }
}

resource "aws_route53_record""catalogue"{

  name    = "catalogue-dev.devops16.online"
  type    = "A"
  zone_id = "Z051652936LR0CPQEANRY"
  ttl = 30
  records =[aws_instance.catalogue.public_ip]
}
resource "aws_instance" "redis" {
  ami              =   data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = { Name = "redis" }
}

resource "aws_route53_record""redis"{

  name    = "redis-dev.devops16.online"
  type    = "A"
  zone_id = "Z051652936LR0CPQEANRY"
  ttl = 30
  records =[aws_instance.redis.public_ip]
}
resource "aws_instance" "user" {
  ami              =   data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = { Name = "user" }
}

resource "aws_route53_record""user"{

  name    = "user-dev.devops16.online"
  type    = "A"
  zone_id = "Z051652936LR0CPQEANRY"
  ttl = 30
  records =[aws_instance.user.public_ip]
}
resource "aws_instance" "cart" {
  ami              =   data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = { Name = "cart" }
}

resource "aws_route53_record""cart"{

  name    = "cart-dev.devops16.online"
  type    = "A"
  zone_id = "Z051652936LR0CPQEANRY"
  ttl = 30
  records =[aws_instance.cart.public_ip]
}
resource "aws_instance" "mysql" {
  ami              =   data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = { Name = "mysql" }
}

resource "aws_route53_record""mysql"{

  name    = "mysql-dev.devops16.online"
  type    = "A"
  zone_id = "Z051652936LR0CPQEANRY"
  ttl = 30
  records =[aws_instance.mysql.public_ip]
}
resource "aws_instance" "shipping" {
  ami              =   data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = { Name = "shipping" }
}
resource "aws_route53_record""shipping"{

  name    = "shipping-dev.devops16.online"
  type    = "A"
  zone_id = "Z051652936LR0CPQEANRY"
  ttl = 30
  records =[aws_instance.shipping.public_ip]
}
resource "aws_instance" "rabbitmq" {
  ami              =   data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = { Name = "rabbitmq" }
}
resource "aws_route53_record""rabbitmq"{

  name    = "rabbitmq-dev.devops16.online"
  type    = "A"
  zone_id = "Z051652936LR0CPQEANRY"
  ttl = 30
  records =[aws_instance.rabbitmq.public_ip]
}
resource "aws_instance" "payment" {
  ami              =   data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = { Name = "payment" }
}

resource "aws_route53_record""payment"{

  name    = "payment-dev.devops16.online"
  type    = "A"
  zone_id = "Z051652936LR0CPQEANRY"
  ttl = 30
  records =[aws_instance.payment.public_ip]
}