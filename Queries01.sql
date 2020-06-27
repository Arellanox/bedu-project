-- mostrar las tablas de la base de datos
show tables;
-- mostrar la descripcion de la tabla
describe venta;

select * 
from empleado
where apellido_paterno ="Risom";

select * 
from empleado
where id_puesto>100;

select * 
from empleado
where id_puesto>=100 and id_puesto<=200;

select * 
from empleado
where id_puesto=100 or id_puesto=200;

select * 
from empleado
where id_puesto in (100,200);

-- ¿Cuál es el nombre de los empleados con el puesto 4?
select nombre, apellido_paterno
from empleado
where id_puesto=4;

-- ¿Qué puestos tienen un salario mayor a $10,000?
select nombre
from puesto 
where salario > 10000;

-- ¿Qué articulos tienen un precio mayor a $1,000 y un iva mayor a 100?
select *
from articulo
where precio>1000 and iva>100;

-- ¿Qué ventas incluyen los artículo 135 o 963 y fueron hechas por los empleados 835 o 369?
select *
from venta
where id_articulo in (135,963) and id_empleado in (835,369);

-- ordenamiento
select * from puesto order by salario desc;

-- limitar los resultados
select * from empleado limit 5;

-- escribe una consulta que permita obtener el top 5 de puestos por salarios.
select * 
from puesto
order by salario desc 
limit 5;

-- 1
use classicmodels;
-- 2
select lastName
from employees;
-- 3
select lastname, firstname, jobtitle
from employees;
-- 4
select * from employees;
-- 5
select lastname,firstname,jobtitle
from employees
where jobtitle="sales rep";
-- 6
select lastname,firstname,jobtitle,officecode
from employees
where jobtitle="sales rep" and officecode=1;
-- 7 
select lastname,firstname,jobtitle,officecode
from employees
where jobtitle="sales rep" or officecode=1;
-- 8
select lastname,firstname,jobtitle,officecode
from employees
where officecode in (1,2,3);
-- 9
select lastname,firstname,jobtitle
from employees
where jobtitle != "sales rep";
-- 10
select lastname,firstname,officecode
from employees
where officecode>5;
-- 11
select lastname,firstname,officecode
from employees
where officecode<=4;
-- 12
select customername,country,state 
from customers
where country="USA" and state="CA";
-- 13
select customername,country,state,creditlimit
from customers
where country="USA" and state="CA" and creditlimit>100000;
-- 14
select customername,country
from customers
where country in ("USA","France");
-- 15
select customername,country,creditlimit
from customers
where country in ("USA","France") and creditlimit>100000;
-- 16
select officecode,city,phone,country
from offices
where country in ("USA","France");
-- 17
select officecode,city,phone,country
from offices
where country not in("USA","France");
-- 18
select ordernumber,customernumber,status,shippeddate
from orders
where ordernumber in (10165,10287,10310);
-- 19
select lastname,firstname
from customers
order by lastname asc;