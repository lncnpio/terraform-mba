CREATE USER IF NOT EXISTS 'usr_mba'@'%' IDENTIFIED BY 'SenhaMBA@rqu!t3tur@';

GRANT ALL PRIVILEGES ON usr_mba.* TO 'usr_mba'@'%' IDENTIFIED BY 'SenhaMBA@rqu!t3tur@';

CREATE DATABASE IF NOT EXISTS DB_LNCN_MBA;
ALTER DATABASE DB_LNCN_MBA DEFAULT CHARACTER SET latin1 DEFAULT COLLATE latin1_swedish_ci;

USE DB_LNCN_MBA;
CREATE TABLE TB_LNCN_MBA (id INT NOT NULL, nome VARCHAR(50) NOT NULL, curso VARCHAR(50) NOT NULL, instituto VARCHAR(50) NOT NULL, PRIMARY KEY (id));
INSERT INTO TB_LNCN_MBA (id,nome,curso,instituto) VALUES(1,'Lyncon de Oliveira Pio', 'Arquitetura de Soluções Digitais', 'Faculdade Impacta de Tecnologia');
SELECT * FROM TB_LNCN_MBA;