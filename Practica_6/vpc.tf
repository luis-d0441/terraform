/* A pesar de ser el .tf mas grande podemos incluir todo lo necesario para deployar una infraestructura en AWS de red,
subredes, internet gateway, route table, route table association, security group y una instancia EC2

*/

//https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.virginia_cidr
  tags = {
    "Name" = "vpc_virginia"
  }
}

//https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.vpc_virginia.id
    cidr_block = var.subnets[0]
    map_public_ip_on_launch = true
    tags = {
      "Name" = "public_subnet"
    }
}


//https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
resource "aws_subnet" "private_subnet"{
    vpc_id = aws_vpc.vpc_virginia.id
    cidr_block = var.subnets[1]
    tags = {
      "Name" = "private_subnet"
    }
    depends_on = [
        aws_subnet.public_subnet
    ]
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_virginia.id
  tags = {
    "Name" = "igw vpc virginia"
  }
}


//https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table
resource "aws_route_table" "public_crt" {
  vpc_id = aws_vpc.vpc_virginia.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    "Name" = "public_crt"
  }
}


//https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association
resource "aws_route_table_association" "crta_public_subnet" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_crt.id
}


//https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
resource "aws_security_group" "sg_public_instance" {
    name = "sg_public_instance"
    description = "Allow SSH inbound traffic"
    vpc_id = aws_vpc.vpc_virginia.id
    
  ingress {
        description = "SSH over Internet"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = [var.sg_ingress_cidr]
  }
   ingress {
    description = "HTTP over Internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.sg_ingress_cidr]
  }

  ingress {
    description = "MySQL over Internet"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.sg_ingress_cidr]
  }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
  }

    tags = {
      "Name" = "sg_public_instance"
    }
}

