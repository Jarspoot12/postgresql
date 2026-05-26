-- Nombre, apellido e IP, donde la última conexión se dió de 221.XXX.XXX.XXX
SELECT first_name, last_name, last_connection
FROM users
WHERE last_connection LIKE '221.%';


-- Nombre, apellido y seguidores(followers) de todos a los que lo siguen más de 4600 personas
SELECT first_name, last_name, followers
FROM users
WHERE followers > 4600;

-- cuyos followers sean arriba o igual que 4600 y menor o igual que 4700
SELECT first_name, last_name, followers
FROM users
WHERE followers BETWEEN 4600 AND 4700 -- límites inclusivos []
ORDER BY followers ASC;

-- estadísticas de la base de datos
SELECT
	COUNT(*) AS total_users, -- conteo de registros
	MIN(followers) AS min_followers, -- mínimo de seguidores en la tabla
	MAX(followers) AS max_followers, --- máximo de seguidores en tabla
	AVG(followers) AS avg_followers, -- promedio de seguidores
	ROUND(AVG(followers)) AS round_avg_followers -- promedio redondeado
FROM users;


-- personas con más followers
select max(followers) from users -- número máximo de followers

select id, first_name, followers 
from users
where followers = (select max(followers) from users)

-- uso de group by para conteos
select count(*), followers 
from users
where followers = 4 or followers = 4999
group by followers

-- having filtra a la función agregada
select count(*), country
from users
group by country
having count(*) > 6 -- filtrar los países con más de 6 usuarios
order by count(*) desc


-- group by con otras funciones
--- cuántos dominios pertenecen a más de un correo
select
	count(*) as total, 
	substring(email, position('@' in email) +1) as domain
from
	users
group by domain
having count(*) > 1

-- creación de una subconsulta (select dentro de select), requiere envolver con paréntesis
select
	 sum(total) -- suma cuántos correos hay con dominios repetidos
from (
	select
		count(*) as total, 
		substring(email, position('@' in email) +1) as domain
	from
		users
	group by domain
	having count(*) > 1
	) email_domain




