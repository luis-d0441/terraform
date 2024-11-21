variable "file_content" {
  description = "variable que me permite agregar infromacion"
  type        = string
  default = "Este es el mensaje por default de mi cadena"
}

variable "random_string_length" {
  description = "Denifir la longitud de la cadena"
  type = number
  default = 5
  
}