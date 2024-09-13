/* Description: 
This file contains the 
commands to create the 
database and the table
login into mysql */

-- Mysql functions
-- https://www.w3schools.com/mysql/mysql_ref_functions.asp

mysql -u root -p

--Create database
CREATE DATABASE hello_sql;

-- Create something into the database
CREATE TABLE `hello_sql`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `surname` VARCHAR(100) NULL,
  `age` INT NULL,
  `init_date` DATE NULL,
  `email` VARCHAR(100) NULL,
  PRIMARY KEY (`user_id`));

-- Insert
INSERT INTO `hello_sql`.`users` (`name`, `surname`, `age`, `init_date`, `email`)
VALUES 
('John', 'Doe', 30, '2023-01-15', 'john.doe@example.com'),
('Jane', 'Smith', 25, '2022-06-22', 'jane.smith@example.com'),
('Michael', 'Brown', 45, '2021-09-10', 'michael.brown@example.com'),
('Emily', 'Davis', 29, '2020-11-05', 'emily.davis@example.com'),
('David', 'Wilson', 35, '2019-03-30', 'david.wilson@example.com'),
('Sophia', 'Garcia', 27, '2018-08-14', 'sophia.garcia@example.com'),
('Daniel', 'Martinez', 40, '2017-02-12', 'daniel.martinez@example.com'),
('Emma', 'Lopez', 32, '2016-12-01', 'emma.lopez@example.com'),
('Oliver', 'Gonzalez', 28, '2015-07-25', 'oliver.gonzalez@example.com'),
('Ava', 'Hernandez', 23, '2014-05-19', 'ava.hernandez@example.com');

INSERT INTO companies (name)
VALUES
('Google'),
('Apple Inc.'),
('Amazon'),
('Microsoft'),
('Facebook'),
('Tesla Inc.'),
('Netflix'),
('Uber Technologies'),
('Spotify'),
('Adobe Inc.');

INSERT INTO languages (name)
VALUES
('Python'),
('JavaScript'),
('Ruby'),
('Java'),
('C#'),
('C++'),
('PHP'),
('Swift'),
('Go'),
('TypeScript');


INSERT INTO dni (dni_number, user_id) VALUES ("777828385", 6);
INSERT INTO dni (dni_number, user_id) VALUES ("777828386", 7);
INSERT INTO dni (dni_number, user_id) VALUES ("777828387", 8);

-- Select
SELECT * FROM users;
SELECT name, surname FROM users;

-- Los campos distintos y su valor de la columna 
SELECT DISTINCT AGE FROM users;

-- Where
SELECT DISTINCT name, age FROM users WHERE age = 30; -- solo los unicos que cumplen la condicion
SELECT name, age FROM users WHERE age = 30; -- todos los que cumplen la condicion

-- Order by
SELECT * FROM users ORDER BY name DESC;
SELECT * FROM users ORDER BY name ASC;
SELECT * FROM users WHERE email='oliver.gonzalez@example.com' ORDER BY name DESC;
SELECT name FROM users WHERE email='oliver.gonzalez@example.com' ORDER BY name DESC;

-- Like
SELECT name, email, age FROM users WHERE email LIKE "%example.com"; -- todos los que terminan con example.com
SELECT name, email, age FROM users WHERE email LIKE "%@%"; -- todos los que tienen @
SELECT name, email, age FROM users WHERE email LIKE "oliver%";  -- todos los que empiezan con oliver

-- not like
SELECT name, email, age FROM users WHERE NOT email LIKE "%example.com%"; -- todos los que no terminan con example.com
SELECT name, email, age FROM users WHERE NOT email LIKE "%@%"; -- todos los que no tienen @
SELECT name, email, age FROM users WHERE NOT email LIKE "oliver%"; -- todos los que no empiezan con oliver

-- concatenar
SELECT name, email, age FROM users WHERE NOT email LIKE "oliver%" AND age = 30 OR name = 'John'; -- AND tiene prioridad sobre OR
SELECT name, email, age FROM users WHERE NOT email LIKE "oliver%" OR name = "Jhon"; -- OR tiene prioridad sobre AND

-- limit
SELECT * FROM users LIMIT 5; -- limita a 5
SELECT * FROM users LIMIT 5 OFFSET 5; -- limita a 5 y salta los primeros 5

-- Update
UPDATE users SET age = 31 WHERE name = 'John';
UPDATE users SET company_id = 1 WHERE user_id = 1;
UPDATE users SET company_id = 2 WHERE user_id = 2;
UPDATE users SET company_id = 3 WHERE user_id = 3;
UPDATE users SET company_id = 3 WHERE user_id = 4;
UPDATE users SET company_id = 3 WHERE user_id = 5;
UPDATE users SET company_id = 6 WHERE user_id = 6;


-- functions
SELECT MAX(age) FROM users; -- maximo
SELECT MIN(age) FROM users; -- minimo
SELECT COUNT(age) FROM users; -- contar los registros que tienen age
SELECT COUNT(*) FROM users; -- contar todos los registros 
SELECT SUM(age) FROM users; -- sumar todos los age
SELECT AVG(age) FROM users; -- promedio de los age
SELECT CONCAT(name, surname) FROM users; -- concatenar los campos name y surname
SELECT CONCAT("nombre:", name, ' ', "apellidos:", surname) AS "Nombre Completo" FROM users; -- concatenar los campos name y surname con un alias
SELECT CONCAT("nombre:", name, ' ', "apellidos:", surname) FROM users; -- concatenar los campos name y surname

-- group by
SELECT age, COUNT(*) FROM users GROUP BY age; -- agrupar por age y contar cuantos hay
SELECT age FROM users group by age order by age DESC -- agrupar por age y ordenar por age de forma descendente
SELECT COUNT(age), age  FROM users WHERE age > 30 group by age order by age DESC -- agrupar por age y contar cuantos hay y que sean mayores a 30 y ordenar por age de forma descendente

-- having 
SELECT * FROM users HAVING age > 30; 
SELECT COUNT(age) FROM users WHERE age > 34; -- no se puede usar where con count
SELECT COUNT(age) FROM users HAVING COUNT(age) > 6; --  no se puede usar where con count pero si con having
SELECT * FROM users HAVING age > 30; -- no se puede usar where con count pero si con having

-- no senstitive case
SELECT * FROM users WHERE name IN ('Sophia'); -- no es sensible a mayusculas y minusculas
SELECT * FROM users WHERE name IN ('sophia'); -- no es sensible a mayusculas y minusculas
SELECT * FROM users WHERE name IN ('sophia', 'john'); -- no es sensible a mayusculas y minusculas y puede ser mas de uno 

-- Between
SELECT * FROM users WHERE age BETWEEN 40 AND 50; -- entre 40 y 50

-- alias
SELECT name AS nombre, email AS correo FROM users;

-- case
SELECT age, name,
CASE
    when age > 40 THEN 'Tiene 40 o más'
    else 'Joven'
END AS edades
FROM users;

SELECT age, name,
CASE
    when age > 40 THEN true
    when age < 45 THEN true
    else false
END AS edades
FROM users;

-- null functions
SELECT * FROM users WHERE surname IS NOT NULL
SELECT * FROM users WHERE surname IS NULL



-- INSERT 
INSERT INTO users (user_id, name, surname) VALUES (22, 'Adan', 'Gonzalez'); -- insertar un registro con un id especifico 
INSERT INTO users ( name, surname) VALUES ('Adan', 'Gonzalez'); -- insertar un registro


-- UPDATE siempre se hacen con una parte de filtrado
SET SQL_SAFE_UPDATES = 0;
UPDATE users SET age = '22', name = "Adansuku" WHERE name = 'Adan'; 
UPDATE users SET name = 'Otro nombre' WHERE name = 'Adan'; -- actualiza el nombre de Adan a 21

-- Delete
DELETE FROM users WHERE name = 'Adan';


-- WORKING WITH TABLES

-- Create table
CREATE DATABASE test;

CREATE TABLE persons (
    id INT NOT NULL AUTO_INCREMENT UNIQUE,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(100),
    age INT DEFAULT 0,
    email VARCHAR(100) DEFAULT "noemail@example.com",
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id) -- clave primaria
    CHECK(age > 18) -- restriccion para mayores de 18 años por ejemplo
);

-- Alter Table
ALTER TABLE persons 
ADD other_name VARCHAR(100); -- añadir una columna

RENAME TABLE persons TO persons2; -- renombrar la tabla

ALTER TABLE persons
RENAME COLUMN other_name TO other_name2; -- renombrar una columna

ALTER TABLE persons
MODIFY COLUMN other_name2 VARCHAR(300); -- renombrar una columna

ALTER TABLE persons
DROP COLUMN other_name2; -- eliminar una columna

-- Relationships
ALTER TABLE users 
ADD CONSTRAINT fk_companies
FOREIGN KEY(company_id) REFERENCES companies(company_id); -- añadir una clave foranea a la tabla users que haga referencia a la tabla companies

-- 1:N
ALTER TABLE users 
ADD CONSTRAINT fk_companies
FOREIGN KEY(company_id) REFERENCES companies(company_id);

-- 1:1
CREATE TABLE dni(
dni_id INT AUTO_INCREMENT PRIMARY KEY,
dni_number INT NOT NULL,
user_id INT,
UNIQUE(dni_id),
FOREIGN KEY(user_id) REFERENCES users(user_id)
);


CREATE TABLE languages(
language_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL
);

-- N:M
CREATE TABLE users_languages(
users_language_id int AUTO_INCREMENT PRIMARY KEY,
user_id int,
language_id int,
FOREIGN KEY(user_id) REFERENCES users(user_id),
FOREIGN KEY(language_id) REFERENCES languages(language_id),
UNIQUE (user_id, language_id)
);

-- Drop table
DROP TABLE persons2;


--- create table with foreign key
CREATE TABLE dni(
dni_id INT AUTO_INCREMENT PRIMARY KEY,
dni_number INT NOT NULL,
user_id INT,
UNIQUE(dni_id),
FOREIGN KEY(user_id) REFERENCES users(user_id)
);


-- Drop database
DROP DATABASE test;



INSERT INTO users_languages (user_id, language_id) VALUES (3,7);
SELECT * FROM users_languages;
SELECT * FROM users;
SELECT * FROM languages;

INSERT INTO languages (name)
VALUES
('Python'),
('JavaScript'),
('Ruby'),
('Java'),
('C#'),
('C++'),
('PHP'),
('Swift'),
('Go'),
('TypeScript');



-- Querys
-- 1:1
SELECT * FROM users 
INNER JOIN dni
ON users.user_id = dni.user_id;

SELECT * FROM users 
LEFT JOIN dni
ON users.user_id = dni.user_id;

SELECT * FROM users 
RIGHT JOIN dni
ON users.user_id = dni.user_id;

SELECT * FROM users 
RIGHT JOIN dni
ON users.user_id = dni.user_id
ORDER BY age DESC;

SELECT name, dni_number, age FROM users 
RIGHT JOIN dni
ON users.user_id = dni.user_id
ORDER BY age DESC;

-- 1:N
SELECT * FROM users
JOIN companies
ON users.company_id = companies.company_id;

SELECT * FROM users
LEFT JOIN companies
ON users.company_id = companies.company_id;

SELECT * FROM users
RIGHT JOIN companies
ON users.company_id = companies.company_id;

SELECT companies.name, users.name FROM companies
JOIN users
ON companies.company_id = users.company_id

-- N:M
SELECT users.name, languages.name
FROM users_languages
JOIN users ON users_languages.user_id = users.user_id
JOIN languages on users_languages.language_id = languages.language_id;


-- LEFT JOIN
SELECT users.name, dni.dni_number FROM users
LEFT JOIN dni
ON users.user_id = dni.user_id;


-- FULL JOIN
-- No existe en mysql

SELECT * FROM users 
FULL JOIN dni
ON users.user_id = dni.users_id;








-- Null
SELECT * FROM users WHERE surname IS NOT NULL 
SELECT * FROM users WHERE surname IS NULL 

-- Exit
exit;
```




