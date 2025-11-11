FROM php:8.2-apache

# Cài gói cần thiết để biên dịch PDO SQLite
RUN apt-get update && apt-get install -y libsqlite3-dev \
    && docker-php-ext-install pdo pdo_sqlite \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy mã nguồn vào thư mục web
COPY . /var/www/html/

# Phân quyền để Apache truy cập file SQLite
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

EXPOSE 80