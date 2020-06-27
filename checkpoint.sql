select * from city;
select * from country;
select * from countrylanguage;


-- 1 ¿cual es el nombre de todos los paises?
select name from country;

-- 2 ¿cual es el pais con mayor poblacion?
select * from country order by population desc limit 1;

-- 3 ¿cual son los paises con experanza de vida mayor a 80?
select * from country where lifeexpectancy >80;

-- 4 ¿cual es el top 5 de paises con mayor poblacion en asia?
select * from country where continent="Asia" order by population desc limit 5;

-- 5 cuales son los paises cuyo nombre comienza con a
select * from country where name like 'a%';

-- 6 cuales son los continentes cuyo nombre lleve 'ame' en su nombre
select * from country where continent like '%ame%';

-- 7 que paises tiene la siguiente cadena Arub_ sin impoartar la letra final
select * from country where name like 'Arub_';

-- 8 cual es la poblacion general de la tierra (se suman todas las poblaciones)
select sum(population) as poblacion_total from country;

-- 9 cual es la poblacion total de asia
select sum(population) as poblacion_asia 
from country
where continent = "Asia";

-- 10 cuantos paises pertenecen al continente asiatico
select count(*) as total from country
where continent = "Asia";

-- 11 cuantos paises pertenecen a cada continente
select continent, count(*) as total_paises
from country
group by continent;

-- 12 cual es el mayor numero de paises de un continente
select max(total_paises) as mayor from
(select continent, count(*) as total_paises
from country
group by continent) as cantidades;

-- 13 cual es el menor numero de paises de un continente
select min(total_paises) as mayor from
(select continent, count(*) as total_paises
from country
group by continent) as cantidades;

-- 14 cual es el promedio de paises de cada continente
select avg(total_paises) as promedio from
(select continent, count(*) as total_paises
from country
group by continent) as cantidades;

-- 15 mostrar nombre del paise, continenten y region de todos los paises con headofstate sea Beatrix
select name,continent,region,headofstate
from country
where headofstate in (select headofstate from country where headofstate="Beatrix");

-- 16 mostrar los nombres de las ciudades de cada pais
select c.name as pais, ct.name as ciudad
from country as c
join city as ct
on ct.countrycode=c.code
order by c.name;

-- 17 mostrar los paises que no tengan ciudades
select c.name
from country as c
left join city as ct
on  c.code=ct.countrycode
where countrycode is null;

-- 18 mostrar las ciudades que no tengan paises
select ct.name
from country as c
right join city as ct
on  c.code=ct.countrycode
where countrycode is null;

-- 19 crear una vista que muestre el el codigo y las ciudades de cada pais
create view ciudades_pais as 
select c.code,c.name as pais, ct.name as ciudad
from country as c
join city as ct
on ct.countrycode=c.code
order by c.name;

-- 20 mostrar las ciudades de cada paise cuyo codigo tiene AFG
select * from ciudades_pais where code="AFG";



