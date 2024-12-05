/*
Dentro de este archivo declaramos solo las variables con las caracteristicas que tienen que llevar, como tipo, descripcion y valor

*/

variable "virginia_cidr" {
    description = "CIDR VIRGINIA"
    type = string
}

variable "subnets" {
    description = "lista de subnets"
    type =list(string)  
}

variable "tags" {
    description = "Tags del proyecto"
    type = map(string)
}

variable "sg_ingress_cidr" {
  description = "CDIR for ingres traffic"
  type = string
}

variable "ec2_specs" {
    description = "Parameters de la instancia"
    type = map(string)
  
}