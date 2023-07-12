locals {
  name = var.env != "" ? "${var.component_name}-${var.env}" : var.component_name
  db_commands=[
    "rm -rf Roboshop-learn-shell",
    "git clone https://github.com/sreesai169/Roboshop-learn-shell.git",
    "cd Roboshop-learn-shell",
    "ls",
    "bash ${var.component_name}.sh ${var.password}"
  ]
  app_commands=[
    "labauto ansible",
    "ansible-pull -i localhost, -U https://github.com/sreesai169/roboshop-ansible roboshop.yml -e env=${var.env} -e role_name=${var.component_name}"
  ]
  db_tags= {
    Name = "${var.component_name}-${var.env}"
  }
  app_tags= {
    Name = "${var.component_name}-${var.env}"
    Monitor = "true"
    component = var.component_name
    env = var.env
  }
}