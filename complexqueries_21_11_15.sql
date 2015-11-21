select t1.country_name, npop, nairports, cast(nairports as 
float)/npop*1000 as pc
from 
  (select country_name, sum(population) as npop
  from optd_por_public
  where population is not null
  group by country_name) as t1,
  
  (select country_name, count(*) as nairports 
  from optd_por_public
  
  where location_type='A' or location_type='CA'
  group by country_name) as t2 

where t1.country_name= t2.country_name and npop > 0

order by pc desc limit 10;



select population.country_name, npop, nairports
from population, airports
where population.country_name = airports.country_name
order by npop desc limit 10;

-- JOIN 

SELECT airline_code_2c, name, flight_freq
FROM ref_airline_nb_of_flights AS r
LEFT OUTER JOIN optd_airlines AS o
ON o."2char_code"= r.airline_code_2c
order by flight_freq desc limit 10;

SELECT airline_code_2c, name, flight_freq
FROM optd_airlines AS o
RIGHT OUTER JOIN ref_airline_nb_of_flights AS r
ON o."2char_code"= r.airline_code_2c
order by flight_freq desc limit 10;

SELECT airline_code_2c, name, flight_freq
FROM optd_airlines AS o
LEFT OUTER JOIN ref_airline_nb_of_flights AS r
ON o."2char_code"= r.airline_code_2c;

SELECT airline_code_2c, name, flight_freq
FROM ref_airline_nb_of_flights AS r
RIGHT OUTER JOIN optd_airlines AS o
ON o."2char_code"= r.airline_code_2c;

SELECT name, country_name, elevation
FROM optd_por_public
WHERE elevation > (SELECT avg(elevation) FROM
optd_por_public) AND 
location_type='C'
LIMIT 10;

SELECT country_name, count(*) AS n 
FROM optd_por_public
WHERE elevation > (
  SELECT avg(elevation) FROM optd_por_public) 
  FROM optd_por_public
  WHERE elevation IS NOT NULL AND location_type='C'
) AND location_type="C"
GROUP BY country_name
HAVING COUNT(*) >=3;

-- ejercicio de la transparencia 90-92 21_11_15

-- nombre y precios de los productos

CREATE TABLE fabricantes(
   codigo INT PRIMARY KEY
   nombre VARCHAR
);

CREATE TABLE articulos(
   codigo INT PRIMARY KEY,
   nombre VARCHAR,
   precio INT,
   fabricante INT REFERENCES fabricantes(codigo)
);

-- fabricantes con articulos entre 60 y 200 euros

SELECT DISTINCT fabricante INT FROM A
WHERE precio >=60 AND p>=200

--  

SELECT f.nombre, COUNT(*)
FROM d