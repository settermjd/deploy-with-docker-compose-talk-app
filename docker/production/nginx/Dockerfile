FROM nginx:alpine

WORKDIR /var/www/html

COPY . .

COPY ./docker/production/nginx/default.conf /etc/nginx/conf.d/default.conf
