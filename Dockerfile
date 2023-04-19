FROM ubuntu:latest
RUN apt-get update && apt-get install -y wget git tar

# Set working directory to /var/www/html
WORKDIR /var/www/html

# Download Wordpress
RUN wget https://wordpress.org/latest.tar.gz

# Extract Wordpress
RUN tar -xzvf latest.tar.gz

# Remove Wordpress archive
RUN rm -rf latest.tar.gz

# Change directory to wp-content
RUN cd wp-content

# Clone postgresql-for-wordpress repository
RUN git clone https://github.com/kevinoid/postgresql-for-wordpress.git

# Rename the directory
RUN mv postgresql-for-wordpress/pg4wp Pg4wp

# Remove postgresql-for-wordpress directory
RUN rm -rf postgresql-for-wordpress

# Copy db.php file
RUN cp Pg4wp/db.php db.php
