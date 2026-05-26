select * from users

-- operadores con strings
SELECT
	id,
	UPPER(name) as upper_name,
	LOWER(name) as lower_name,
	LENGTH(name) as length,
	TRIM(name) clean_name,
	CONCAT(id, ' --> ', name),
	-- subtring 
	SUBSTRING(name, 0, POSITION(' ' in name)) as first_name, -- sbt(column, initial_p, final_p)
	SUBSTRING(name, POSITION(' ' in name)+1) as last_name -- sumo +1 para evitar el espacio en blanco, igual puedo usar TRIM()
FROM users

-- actualizarlos registros con primer y segundo nombre (posterior al alter tablñe para crear dichas columnas)
UPDATE users
SET 
	first_name = SUBSTRING(name, 0, POSITION(' ' in name)),
	last_name = SUBSTRING(name, POSITION(' ' in name)+1) 

