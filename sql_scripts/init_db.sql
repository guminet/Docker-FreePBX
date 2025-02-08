-- Create DB
CREATE DATABASE IF NOT EXISTS `asterisk`;
CREATE DATABASE IF NOT EXISTS `asteriskcdrdb`;

-- Create user
GRANT ALL ON asterisk.* TO 'asterisk'@'localhost' IDENTIFIED BY 'asterisk';
GRANT ALL ON asterisk.* TO 'asterisk'@'%' IDENTIFIED BY 'asterisk';
GRANT ALL ON asteriskcdrdb.* TO 'asterisk'@'localhost' IDENTIFIED BY 'asterisk';
GRANT ALL ON asteriskcdrdb.* TO 'asterisk'@'%' IDENTIFIED BY 'asterisk';
