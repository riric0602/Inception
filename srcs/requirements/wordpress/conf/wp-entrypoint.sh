#!/bin/sh

# Run WordPress installation if not already installed
if ! $(wp core is-installed); then
	wp core install --url="$DOMAIN_NAME" --title="Riri's Inception" --admin_user="$ADMIN_USER" --admin_password="$ADMIN_PASS" --admin_email="$ADMIN_MAIL"
	wp user create $NEW_USER $USER_MAIL --user_pass=$USER_PASS --allow-root
	wp theme install writers-haven --activate --allow-root
	# Install and activate Redis Cache plugin
	wp plugin install wp-redis --activate --allow-root
	# Enable Redis caching
	wp wp-redis enable --allow-root
fi

# Start PHP-FPM
php-fpm81 -F

