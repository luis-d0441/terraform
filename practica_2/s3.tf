resource "aws_s3_bucket" "proveedores" {
  count  = 5
  bucket = "proveedores-${random_string.sufijo[count.index].id}"
  tags = {
    Owner       = "Luis Alvarez"
    Environment = "Dev"
    Office      = "proveedores"
  }
}

resource "random_string" "sufijo" {
  count   = 5
  length  = 8
  special = false
  upper   = false
  numeric = false
}