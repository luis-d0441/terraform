/*
Dentro de este archivo se declaran las variables que se utilizaran en el proyecto,las variables previamente tenemos que
definirlas en el archivo variables.tf
*/

virginia_cidr = "10.10.0.0/16"

subnets = [ "10.10.0.0/24", "10.10.1.0/24" ] //Revisar 

tags = {
  "env" = "dev"
  "owner" = "Gabo"
  "Cloud" = "AWS"
  "IAC" = "Terraform"
  "IAC_VERSION" = "1.5"
}
sg_ingress_cidr = "0.0.0.0/0"

ec2_specs = {
  "ami" = "ami-0942ecd5d85baa812"
  "instance_type" = "t2.micro"

}