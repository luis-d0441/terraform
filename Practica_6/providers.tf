/*
Cuando comenzamos un proyecto en terraform debemos asignar quien es el provider que vamos a utilizar, en este caso sera el de AWS
la version 5.76.0 es la ultima que tenemos en la documentacion
*/


terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.76.0"
    }
  }
}
/*
Asi como creamos el keypair dentro de la region de ohio, esta cadena nos permite asignar la region de ohio a nuestro provider
*/

provider "aws" {
  region = "us-east-2"
  alias = "ohio"
}
