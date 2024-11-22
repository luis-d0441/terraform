/*
Dentro de aws_instace, necesitamos algunos campos que nos permiten crear una ec2 de amazon linux, 
como se muestra en el siguiente ejemplo, los datos los obtenemos de las variables que hemos definido. 
La manera de invocar una variables es con var.nombre_de_la_variable, en este caso, var.ec2_specs.ami manda llamar 
el id de la ami para crear una amazon linux
*/


/*Declaramos la variable instancias que es una lista de strings con valores por default "apache", "monitoreo", "Base de datos" 
con esto podemos decir que queremos crear 3 instancias de ec2 con el nombre de cada una de las instancias
*/

variable "instancias" {
  description = "Nombre de la instancia"
  type        = list(string)
  default     = ["apache", "monitoreo", "Base de datos" ]

}


//https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "public_instance"  {
    for_each = toset(var.instancias) // con este comando le decimos a terraform que queremos crear una instancia por cada valor de la lista instancias 
    ami=var.ec2_specs.ami //pueden encontrar este valor declarado en variables.tf y asignado en terraform.tfvars
    instance_type = var.ec2_specs.instance_type
    subnet_id = aws_subnet.public_subnet.id
    key_name = data.aws_key_pair.key.key_name
    vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
    tags = {
    "Name" = "${each.value}"
     }

}



