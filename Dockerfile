FROM php:apache

RUN apt-get update \
  && apt-get install --yes --no-install-recommends libpq-dev \
  && apt-get install --yes zlib1g-dev \
  && apt-get install --yes libzip-dev \  
  && docker-php-ext-install zip \  
  && docker-php-ext-install pdo_pgsql \      
  && chmod 777 /var/www/html \      
  && pecl install xdebug \
  && docker-php-ext-enable xdebug \
  && echo "xdebug.remote_autostart=1" | tee -a /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini > /dev/null \
  && echo "xdebug.remote_enable=1" | tee -a /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini > /dev/null \
  && echo "xdebug.remote_host=localhost" | tee -a /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini > /dev/null \
  && echo "xdebug.idekey=VSCODE" | tee -a /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini > /dev/null \
  && echo "xdebug.remote_connect_back=1" | tee -a /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini > /dev/null  
