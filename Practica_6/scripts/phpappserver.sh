#!/bin/bash
echo "Este es un mensaje desde consola " > ~/mensaje.txt
sudo apt-get update -y
sudo apt-get install -y apache2
sudo apt-get install -y php libapache2-mod-php
sudo systemctl start apache2
sudo systemctl enable apache2
echo "<?php phpinfo(); ?>" > /var/www/html/index.php