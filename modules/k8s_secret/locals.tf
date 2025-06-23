locals {
  username = trimspace(file(var.username_file))
  password = trimspace(file(var.password_file))
}
