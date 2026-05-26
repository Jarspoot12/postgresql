-- creación de tablas y su eliminación
create table users(
	name varchar(10) unique
);

DROP TABLE users;

-- inserción de registros (insert into -> values)
INSERT INTO users
VALUES
('Jared2'),
('Imanol2');

-- desactivar autocommit para que no se afecte la base de datos automáticamente


-- actualización de registros (update -> set -> where)
UPDATE users
SET name = 'JaredOG'
WHERE name = 'Jared'; -- recordar que es case sensitive (trata distinto mayúsculas y minúsculas)

-- seleccionar registros
SELECT * FROM users
WHERE name LIKE 'Jared%'; -- las comillas dobles ("") harían referencia a una tabla llamada Jared1

-- eliminar registros, es igual al select pero con la palabra delete
DELETE FROM users
WHERE name LIKE 'Jared%'; -- las comillas dobles ("") harían referencia a una tabla llamada Jared1

-- truncate, purga todos los registros pero mantiene la estructura de la tabla
TRUNCATE TABLE users
select * from users