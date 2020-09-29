# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fermelin <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/21 16:14:18 by fermelin          #+#    #+#              #
#    Updated: 2020/09/29 17:56:32 by fermelin         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && apt-get -y install	nginx \
											mariadb-server \
											php7.3-fpm \
											php7.3-mysql \
											wordpress \
											openssl 

COPY ./srcs/default /etc/nginx/sites-available 
COPY ./srcs/start_services.sh ./srcs/db_init.sql / 
#COPY ./srcs/ssl-params.conf ./srcs/self-signed.conf /etc/nginx/snippets/ 
#COPY ./srcs/fermelin.crt ./srcs/dhparam.pem /etc/ssl/certs/ 
#COPY ./srcs/fermelin.key /etc/ssl/private/fermelin.key 
COPY ./srcs/autoindex.sh /

RUN mv /usr/share/wordpress /var/www/html

ADD https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz phpmyadmin.tar.gz
RUN tar xzf phpmyadmin.tar.gz && mv phpMyAdmin-5.0.2-all-languages /var/www/html/phpmyadmin

#COPY .srcs/wp-config.php /var/www/html/wordpress
COPY ./srcs/config.inc.php /var/www/html/phpmyadmin/


RUN chown -R www-data /var/www/html

EXPOSE 80 443

RUN service mysql start < db_init.sql

ENTRYPOINT bash start_services.sh
