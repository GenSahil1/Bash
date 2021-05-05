#!/bin/bash

#echo "Checking new versions $(sudo apt-get update && sudo apt-get -y upgrade)"

if [[ -e "/etc/nginx/conf.d" ]];then
	echo "File Exists"
else
	echo "Installing Nginx $(sudo apt-get install -y nginx)"
fi

if [[ -e "/etc/ufw/ufw.conf" ]];then
	echo "File Exists"
else
	echo "Installing UFW $(sudo apt-get -y install ufw)"
fi

if [[ -e "/etc/mysql/conf.d" ]];then
	echo "File Exists"
else
	echo "Installing MariaDB $(sudo apt-get install -y mariadb-server)"
fi

if [[ -e "/etc/php/7.4/fpm/php.ini" ]];then
	echo "File Exists"
else
	echo "Installing PHP-FPM $(sudo apt-get install -y php-fpm)"
fi

if [[ -e "/etc/php/7.4/mods-available/mysqli.ini" ]];then
	echo "File Exists"
else
	echo "Installing PHPSQL $(sudo apt-get install -y php-mysql)"
fi

echo "Enable HTTP $(sudo ufw allow 'Nginx HTTP')"
echo "Enable SSH $(sudo ufw allow 'OpenSSH')"
echo "Enable UFW $(sudo ufw enable)"
echo "Checking Status $(sudo ufw status)"

#if [[ -e "/etc/nginx/sites-available/example.com" ]];then
#	echo "File Exists"
#else
#	echo "$(cd /etc/nginx/sites-available/ && sudo touch example.com)File Created"
#fi

#echo "$(sudo ln -s /etc/nginx/sites-available/example.com /etc/nginx/sites-enabled)"

echo "$(sudo nginx -t)"
echo "Restarting Nginx: $(sudo systemctl reload nginx)"

if [[ -e "/var/www/html/phpinfo.php" ]];then
	echo "File Exists" 
else
	echo "File Created $(cd /var/www/html && sudo touch phpinfo.php)"
fi

