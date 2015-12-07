
CREATE DATABASE IF NOT EXISTS ride;
USE ride;

DROP TABLE IF EXISTS station_log;
DROP TABLE IF EXISTS station_nearest;
DROP TABLE IF EXISTS station;
DROP TABLE IF EXISTS area;

CREATE TABLE area (
       id INT NOT NULL AUTO_INCREMENT,
       name VARCHAR(100) NOT NULL,
       name_en VARCHAR(100) NOT NULL,
       PRIMARY KEY (id)
);

CREATE TABLE station (
       id INT NOT NULL AUTO_INCREMENT,
       label VARCHAR(10) NOT NULL,
       name VARCHAR(100) NOT NULL,
       address VARCHAR(100) NOT NULL,
       name_en VARCHAR(100) NOT NULL,
       address_en VARCHAR(100) NOT NULL,
       total int NOT NULL,
       available int NOT NULL,
       lat DECIMAL(11, 8) NOT NULL,
       lng DECIMAL(11, 8) NOT NULL,
       area_id INT NOT NULL,
       PRIMARY KEY (id),
       UNIQUE KEY label (label),
       FOREIGN KEY (area_id) REFERENCES area(id)
);

CREATE TABLE station_log (
       id INT NOT NULL AUTO_INCREMENT,
       station_id INT NOT NULL, 
       time TIMESTAMP NOT NULL,
       total INT NOT NULL,
       available INT NOT NULL,
       PRIMARY KEY (id),
       FOREIGN KEY (station_id) REFERENCES station(id)
);

CREATE TABLE station_nearest (
       id INT NOT NULL AUTO_INCREMENT,
       station_id INT NOT NULL, 
       nearest_station_id INT NOT NULL, 
       distance double NOT NULL,
       PRIMARY KEY (id),
       FOREIGN KEY (station_id) REFERENCES station(id),
       FOREIGN KEY (nearest_station_id) REFERENCES station(id)
);

INSERT INTO area (name, name_en) VALUES
       ('板橋區', 'Banqiao'),
       ('北投區', 'Beitou'),
       ('大安區', 'Daan'),
       ('大同區', 'Datong'),
       ('蘆洲區', 'Luzhou'),
       ('南港區', 'Nangang'),
       ('內湖區', 'Neihu'),
       ('三重區', 'Sanchong'),
       ('士林區', 'Shilin'),
       ('樹林區', 'Shulin'),
       ('松山區', 'Songshan'),
       ('泰山區', 'Taishan'),
       ('淡水區', 'Tamsui'),
       ('土城區', 'Tucheng'),
       ('萬華區', 'Wanhua'),
       ('文山區', 'Wenshan'),
       ('五股區', 'Wugu'),
       ('新店區', 'Xindian'),
       ('信義區', 'Xinyi'),
       ('新莊區', 'Xinzhuang'),
       ('汐止區', 'Xizhi'),
       ('鶯歌區', 'Yingge'),
       ('永和區', 'Yonghe'),
       ('中和區', 'Zhonghe'),
       ('中山區', 'Zhongshan'),
       ('中正區', 'Zhongzheng');
