# start with the official Composer image and name it
FROM composer:lts AS composer

# continue with the official PHP image
FROM php:7.4.9

# copy the Composer PHAR from the Composer image into the PHP image
COPY --from=composer /usr/bin/composer /usr/bin/composer

## Add git repository
#RUN apt-get update --fix-missing && apt-get install -y software-properties-common && add-apt-repository ppa:git-core/ppa -y && apt-get install -y --no-install-recommends git
RUN apt-get update\
    && apt-get install -y --no-install-recommends git\
    libzip-dev\
    zip\
    && docker-php-ext-install zip;\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ARG APP_NAME=raml-ts
RUN mkdir -p /opt2/${APP_NAME}
WORKDIR /opt2/${APP_NAME}

# show that both Composer and PHP run as expected
#RUN composer --version && php -v

ENTRYPOINT ["sh", "-c", "composer install && php download-schema @app/api \"https://raw.githubusercontent.com/Marcura/dadesk-module-table-management/master/src/main/resources/tablemanagement-api.raml?token=GHSAT0AAAAAACCOR7KJRG2X7ETEOQONSZDCZFRLAOA\" ./schema-ts-files"]
