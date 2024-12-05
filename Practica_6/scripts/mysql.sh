#!/bin/bash
# Update the package list
sudo apt-get update -y

# Install MySQL server
sudo apt-get install -y mysql-server

# Allow remote connections by updating the MySQL configuration
sudo sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf

# Restart MySQL service to apply changes
sudo systemctl restart mysql

# Secure MySQL installation (optional, requires interaction)
# sudo mysql_secure_installation

# Create a test database and user with remote access (optional)
sudo mysql -e "CREATE DATABASE testdb;"
sudo mysql -e "CREATE USER 'testuser'@'%' IDENTIFIED BY 'password';"
sudo mysql -e "GRANT ALL PRIVILEGES ON testdb.* TO 'testuser'@'%';"
sudo mysql -e "FLUSH PRIVILEGES;"