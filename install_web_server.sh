#!/bin/bash

# Atualizar o sistema
sudo dnf update -y

# Instalar repositório EPEL
sudo dnf install epel-release -y

# Instalar repositório REMI para obter o PHP 8.3
sudo dnf install https://rpms.remirepo.net/enterprise/remi-release-9.rpm -y

# Habilitar o módulo PHP 8.3 do repositório REMI
sudo dnf module reset php -y
sudo dnf module enable php:remi-8.3 -y

# Instalar Apache
sudo dnf install httpd -y

# Instalar PHP 8.3 e módulos necessários
sudo dnf install php php-mysqlnd php-fpm -y

# Iniciar e habilitar o serviço do Apache
sudo systemctl start httpd
sudo systemctl enable httpd

# Abrir portas no firewall para o Apache
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload

# Instalar MySQL 8.0
sudo dnf install @mysql:8.0 -y

# Iniciar e habilitar o serviço do MySQL
sudo systemctl start mysqld
sudo systemctl enable mysqld

# Configurar segurança inicial do MySQL
sudo mysql_secure_installation

# Criar um arquivo PHP de teste
echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php

# Permissões e SELinux
sudo chown -R apache:apache /var/www/html
sudo chmod -R 755 /var/www

# Reiniciar serviços para garantir que todas as mudanças sejam aplicadas
sudo systemctl restart httpd
sudo systemctl restart mysqld

echo "Configuração do servidor web concluída com sucesso!"
echo "Você pode verificar a instalação do PHP acessando http://seu-endereco-ip/info.php"
