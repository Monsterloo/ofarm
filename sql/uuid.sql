INSERT INTO category VALUES(REPLACE(UUID(),'-',''),REPLACE(UUID(),'-',''),'农机','cb6a5d51055411e794f328cfe95897da');

SELECT * FROM category;

CREATE TABLE category_one AS SELECT* FROM category