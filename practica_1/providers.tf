resource "random_string" "random" {
  count = 5//Count nos permite saber cuantas veces va repetir una ejecucion
  length           = var.random_string_length
  special          = true
  override_special = "/@£$"
}

resource "local_file" "foo" {
  content  = "foo!"
  filename = "${path.module}/foo.bar"
}