FROM wordpress:latest

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Install PostgreSQL and the PHP PostgreSQL extension
RUN apt-get update && apt-get install -y postgresql postgresql-client php-pgsql

# Copy the contents of the local directory to the container's /var/www/html directory
COPY . /var/www/html/

# Expose port 80 for the web server
EXPOSE 80

# Start the web server
CMD ["apache2-foreground"]
