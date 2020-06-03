CREATE DATABASE wordpress;
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost';
GRANT USAGE ON *.* TO 'admin'@'localhost';
FLUSH PRIVILEGES;