/*
Dentro de aws_instace, necesitamos algunos campos que nos permiten crear una ec2 de amazon linux, 
como se muestra en el siguiente ejemplo, los datos los obtenemos de las variables que hemos definido. 
La manera de invocar una variables es con var.nombre_de_la_variable, en este caso, var.ec2_specs.ami manda llamar 
el id de la ami para crear una amazon linux
*/


//https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "public_instance"  {
    ami=var.ec2_specs.ami //pueden encontrar este valor declarado en variables.tf y asignado en terraform.tfvars
    instance_type = var.ec2_specs.instance_type
    subnet_id = aws_subnet.public_subnet.id
    key_name = data.aws_key_pair.key.key_name
    vpc_security_group_ids = [aws_security_group.sg_public_instance.id]

}