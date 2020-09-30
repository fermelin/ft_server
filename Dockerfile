# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fermelin <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/21 16:14:18 by fermelin          #+#    #+#              #
#    Updated: 2020/09/30 17:58:32 by fermelin         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

WORKDIR	/project

RUN		apt-get update && apt-get -y install	nginx \
												mariadb-server \
												php7.3-fpm \
												php7.3-mysql \
												wordpress \
												openssl 

ADD		https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz phpmyadmin.tar.gz
RUN		tar xzf phpmyadmin.tar.gz && mv phpMyAdmin-5.0.2-all-languages /var/www/html/phpmyadmin
RUN		rm phpmyadmin.tar.gz

COPY	./srcs/default /etc/nginx/sites-available 
COPY	./srcs/start_services.sh ./srcs/db_init.sql /project/
COPY	./srcs/autoindex.sh /project/

RUN		mv /usr/share/wordpress /var/www/html

COPY	./srcs/wp-config.php /var/www/html/wordpress
COPY	./srcs/config.inc.php /var/www/html/phpmyadmin

RUN		rm /var/www/html/index*

RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout /etc/ssl/private/localhost.key -out /etc/ssl/certs/localhost.crt \
		-subj "/C=RU/ST=Russia/L=Moscow/O=21 School/OU=4th Wave/CN=Vadim Borisov"

RUN		chown -R www-data /var/www/html

RUN 	service mysql start && mysql < db_init.sql

EXPOSE 	80 443

ENTRYPOINT ["bash", "start_services.sh"]
