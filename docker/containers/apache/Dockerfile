FROM meanbee/magento:7.1-apache
MAINTAINER Roman Glushko <roman.glushko.m@gmail.com>

# needed utilits
RUN apt-get update \
        && apt-get install -y \
        supervisor \
        libbz2-dev

# php deps
RUN docker-php-ext-install mbstring \
                           bcmath \
                           bz2

# xsl
RUN apt-get install -y libxslt-dev
RUN docker-php-ext-install xsl

# composer
RUN php -r "readfile('https://getcomposer.org/installer');" | \
    php -- --install-dir /usr/local/bin --filename composer && \
    mkdir -p /home/composer/.composer && \
    ln -s /root/.ssh /home/composer/.ssh

ENV COMPOSER_ALLOW_SUPERUSER 1

# GIT
RUN apt-get update && apt-get install -y git

# php.ini
ADD php.ini /usr/local/etc/php/conf.d/
ADD zz-magento.ini /usr/local/etc/php/conf.d/

# xdebug (installed in parent image)
ADD xdebug.ini /usr/local/etc/php/conf.d/

RUN apt-get update && apt-get install -y mysql-client wget

# useful aliases
RUN echo 'alias ll="ls -alF"' >> ~/.bashrc
RUN echo 'alias la="ls -A"' >> ~/.bashrc
RUN echo 'alias  l="ls -CF"' >> ~/.bashrc
RUN echo 'alias  mage="php bin/magento"' >> ~/.bashrc
RUN echo 'alias  cc="php bin/magento cache:clean && chmod -R 777 var"' >> ~/.bashrc
RUN echo 'alias  fcc="rm -rd var/* || echo \"/var already empty\" && php bin/magento cache:clean && chmod -R 777 var"' >> ~/.bashrc
RUN echo 'alias  cond="php bin/magento setup:static-content:deploy"' >> ~/.bashrc
RUN echo 'alias  fcond="chmod -R 777 var && chmod -R 777 pub/static && rm -rd var/* || echo \"/var already empty\" && rm -rd pub/static/* || echo \"/pub/static already empty\" && php bin/magento cache:clean && php bin/magento setup:static-content:deploy && chmod -R 777 var && chmod -R 777 pub/static"' >> ~/.bashrc
RUN echo 'alias  rmdi="chmod 777 -R var/di && rm -fr var/di"' >> ~/.bashrc
RUN echo 'alias  setup="php bin/magento setup:upgrade && chmod -R 777 var"' >> ~/.bashrc
RUN echo 'alias  compile="php bin/magento setup:di:compile"' >> ~/.bashrc
RUN echo 'alias  dm="php bin/magento deploy:mode:set developer"' >> ~/.bashrc
RUN echo 'alias  reindex="php bin/magento indexer:reindex"' >> ~/.bashrc
RUN echo 'alias  cm="chmod -R 777 var pub/static generated"' >> ~/.bashrc
RUN echo 'alias  cfc="php bin/magento cache:clean block_html full_page"' >> ~/.bashrc

WORKDIR /var/www/html