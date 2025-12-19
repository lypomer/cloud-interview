FROM php:7.4.33-cli as build
    # Get composer binary
    COPY --from=composer:2 /usr/bin/composer /usr/bin/composer
    WORKDIR /build

    # Common composer dependencies
    RUN apt-get update && apt-get install -y --no-install-recommends \
        git unzip libzip-dev \
        && rm -rf /var/lib/apt/lists/

    RUN --mount=type=bind,source=composer.json,target=composer.json \
        --mount=type=bind,source=composer.lock,target=composer.lock \
        --mount=type=bind,source=public,target=public \
            composer install --no-dev --no-interaction --prefer-dist --no-progress

FROM php:7.4.33-apache as run
    WORKDIR /var/www/html
    ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
    
    # Configure apache to serve the app
    RUN a2enmod rewrite \
        && sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/000-default.conf \
        && sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/docker-php.conf

    COPY --from=build /build/vendor vendor/
    COPY public public/

    EXPOSE 80
    HEALTHCHECK CMD curl --fail http://localhost:80 || exit 1
