FROM nginx:alpine

WORKDIR /var/www/html

COPY . .

COPY ./docker/nginx/default.prod.conf /etc/nginx/conf.d/default.conf
