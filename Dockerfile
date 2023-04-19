FROM ubuntu:latest

RUN apt-get update && apt-get install -y wget git

WORKDIR /var/www/html

RUN wget https://wordpress.org/latest.tar.gz \
    && tar -xzvf latest.tar.gz \
    && rm -rf latest.tar.gz \
    && cd /var/www/html/wordpress/wp-content \
    && git clone https://github.com/kevinoid/postgresql-for-wordpress.git \
    && mv postgresql-for-wordpress/pg4wp Pg4wp \
    && rm -rf postgresql-for-wordpress \
    && cp Pg4wp/db.php db.php
