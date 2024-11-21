//local_file es un provider que nos permite administrar archivos locales con terraform


resource "local_file" "miarchivo"{
  count=5 //Count nos permite saber cuantas veces va repetir una ejecucion
  content  = var.file_content
  filename = "${path.module}/miarchivo-${random_string.random[count.index].id}.txt"
}

//Random es parte de otro provider, necesitamos ejecutar terraform init 


/*
Comandos a ejecutar
terraform init 
terraform plan
terraform apply
terraform destroy
*/