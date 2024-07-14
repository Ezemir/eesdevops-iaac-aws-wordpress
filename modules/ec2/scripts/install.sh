#!/bin/bash

DB_HOST="$1"
DB_USER="eesdevops"
DB_PASSWORD="eesdevops"

sudo apt update -y
sudo apt install mysql-client -y

sudo apt install nginx -y

sudo systemctl start nginx
sudo systemctl enable nginx

sudo apt install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update -y
sudo apt install php8.3-fpm php8.3-mysql php8.3-xml php8.3-curl php8.3-mbstring php8.3-zip -y

sudo systemctl restart php8.3-fpm

sudo sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/' /etc/php/8.3/fpm/php.ini

wget https://wordpress.org/latest.tar.gz -P /tmp
tar -xzf /tmp/latest.tar.gz -C /tmp
sudo mv /tmp/wordpress /var/www/html/

sudo chown -R www-data:www-data /var/www/html/wordpress
sudo find /var/www/html/wordpress -type d -exec chmod 755 {} \;
sudo find /var/www/html/wordpress -type f -exec chmod 644 {} \;

sudo tee /etc/nginx/sites-available/wordpress >/dev/null <<EOF
server {
    listen 80;
    server_name localhost;

    root /var/www/html/wordpress;
    index index.php index.html index.htm;

    location / {
        try_files \$uri \$uri/ /index.php?\$args;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.3-fpm.sock;
    }

    location ~ /\.ht {
        deny all;
    }
}
EOF

if [ -L /etc/nginx/sites-enabled/wordpress ]; then
    sudo rm /etc/nginx/sites-enabled/wordpress
fi

sudo ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/

if [ -L /etc/nginx/sites-enabled/default ]; then
    sudo rm /etc/nginx/sites-enabled/default
fi

sudo nginx -t
if [ $? -eq 0 ]; then
    sudo systemctl reload nginx
else
    echo "Erro na configuração do Nginx. Verifique os logs de erro para mais detalhes."
    exit 1
fi

sudo mv /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
sudo sed -i "s/database_name_here/wordpress/" /var/www/html/wordpress/wp-config.php
sudo sed -i "s/username_here/$DB_USER/" /var/www/html/wordpress/wp-config.php
sudo sed -i "s/password_here/$DB_PASSWORD/" /var/www/html/wordpress/wp-config.php
sudo sed -i "s/localhost/$DB_HOST/" /var/www/html/wordpress/wp-config.php

sudo chmod 640 /var/www/html/wordpress/wp-config.php

echo "Configuração concluída com sucesso!"

THEME_DIR=$(sudo find /var/www/html/wordpress/wp-content/themes -maxdepth 1 -type d | grep -v '/\.' | head -n 1)
FUNCTIONS_PHP="$THEME_DIR/functions.php"

sudo bash -c "cat << 'EOF' >> $FUNCTIONS_PHP

function get_instance_ip() {
    \$ip_address = \$_SERVER['SERVER_ADDR'];
    \$current_datetime = date('Y-m-d H:i:s');
    
    \$output = '<p>IP da Instância: ' . \$ip_address . '</p>';
    \$output .= '<p>' . \$current_datetime . '</p>';
    
    return \$output;
}

add_shortcode('meuIP', 'get_instance_ip');
EOF"

sudo systemctl restart php8.3-fpm
