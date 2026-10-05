#!/usr/bin/env bash
# scripts/02_configure_lamp.sh
# Configure LAMP stack services and test page

set -xeu

# Ajustar permisos del directorio web de Apache
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

# Copiar la página de prueba info.php desde la carpeta compartida de Vagrant (/vagrant)
cp -vf /vagrant/files/info.php /var/www/html/test.php

# Habilitar y arrancar los servicios automáticamente
systemctl enable --now apache2
systemctl enable --now mariadb

echo "# LAMP configuration complete."