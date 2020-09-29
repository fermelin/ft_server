CREATE DATABASE ft_server_db;
CREATE USER 'fermelin'@'localhost' IDENTIFIED BY 'fermelin_passw42';
GRANT ALL PRIVILEGES ON ft_server_db.*TO 'fermelin'@'localhost';
FLUSH PRIVILEGES;
