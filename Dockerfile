FROM php:apache

RUN apt-get update \
  && apt-get install --yes --no-install-recommends libpq-dev \
  && apt-get install --yes zlib1g-dev \
  && apt-get install --yes libzip-dev \  
  && docker-php-ext-install zip \  
  && docker-php-ext-install pdo_pgsql \      
  && chmod 777 /var/www/html \      
  && mv /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini \
  && apt -qy install $PHPIZE_DEPS \
  && pecl install xdebug \
  && pecl config-set php_ini /usr/local/etc/php/php.ini \
  && docker-php-ext-enable xdebug \
  && echo "xdebug.remote_autostart=1" | tee -a /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini > /dev/null \
  && echo "xdebug.remote_enable=1" | tee -a /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini > /dev/null \
  && echo "xdebug.remote_host=localhost" | tee -a /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini > /dev/null \
  && echo "xdebug.idekey=VSCODE" | tee -a /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini > /dev/null \
  && echo "xdebug.remote_connect_back=1" | tee -a /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini > /dev/null  