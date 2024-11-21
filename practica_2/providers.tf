resource "random_string" "random" {
  //count = 5//Count nos permite saber cuantas veces va repetir una ejecucion
  count   = var.random_string_length
  length  = 8
  special = false
  upper   = false
  numeric = false
}