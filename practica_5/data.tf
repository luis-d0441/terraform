/*
Denteo de la sentencia data podemos llamar a alugun recurso ya creado en AWS, 
en este caso llamamos a un key pair que ya hemos creado en AWS.
*/

data "aws_key_pair" "key" {
    key_name = "mykey"
}