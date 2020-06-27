select * from empleado
where nombre like 'M%';

select * from empleado
where nombre like 'M_losa';

-- ¿Qué artículos incluyen la palabra Pasta en su nombre?
select * 
from articulo
where nombre like '%pasta%';

-- ¿Qué artículos incluyen la palabra Cannelloni en su nombre?
select * 
from articulo
where nombre like '%Cannelloni%';

-- ¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?
select * 
from articulo
where nombre like '%-%';

select (1 +7) * (10 /(6-4));

select avg(precio) as promedioPrecio from articulo;
select count(*) from articulo;
select max(precio) from articulo;
select min(precio) from articulo;
select sum(precio) from articulo;

-- ¿Cuál es el promedio de salario de los puestos?
select avg(salario) as promedio
from puesto;

-- ¿Cuántos artículos incluyen la palabra Pasta en su nombre?
select count(*)
from articulo
where nombre like '%pasta%';

-- ¿Cuál es el salario mínimo y máximo?
select max(salario),min(salario) from puesto;

-- ¿Cuál es la suma del salario de los últimos cinco puestos agregados?
select sum(salario)
from puesto
where id_puesto >= (select max(id_puesto)-5 from puesto);

select nombre, count(*) as cantidad from articulo
group by nombre
order by cantidad desc;

select nombre, min(salario) as menor, max(salario) as mayor from puesto
group by nombre;

-- ¿Cuántos registros hay por cada uno de los puestos?
select nombre, count(*)
from puesto
group by nombre;

-- ¿Cuánto dinero se paga en total por puesto?
select nombre, sum(salario)
from puesto
group by nombre;

select e.nombre, count(v.clave) as ventas
from venta v, empleado e
where e.id_empleado=v.id_empleado
group by e.nombre;

select * 
from empleado 
where id_puesto in (select id_puesto from puesto where nombre='junior executive');

-- ¿Cuál es el número total de ventas por vendedor?
select id_empleado, count(*)
from venta
group by id_empleado;

-- ¿Cuál es el número total de ventas por artículo?
select id_articulo, count(*) 
from venta
group by id_articulo;
-- 
select id_articulo, min(cantidad), max(cantidad)
from (select clave, id_articulo, count(*) as cantidad
from venta
group by clave, id_articulo
order by clave) as subconsulta
group by id_articulo