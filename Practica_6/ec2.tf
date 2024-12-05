//https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "appserver"  {
    ami=var.ec2_specs.ami //pueden encontrar este valor declarado en variables.tf y asignado en terraform.tfvars
    instance_type = var.ec2_specs.instance_type
    subnet_id = aws_subnet.public_subnet.id
    key_name = data.aws_key_pair.key.key_name
    vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
    user_data = file("${path.module}/scripts/phpappserver.sh")
    tags = {
    "Name" = "AppServer"
     }
}

resource "aws_instance" "mysql" {
    ami=var.ec2_specs.ami
    instance_type = var.ec2_specs.instance_type
    subnet_id = aws_subnet.public_subnet.id
    key_name = data.aws_key_pair.key.key_name
    vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
    user_data = file("${path.module}/scripts/mysql.sh")
    tags = {
    "Name" = "MySQL"
     }
}

