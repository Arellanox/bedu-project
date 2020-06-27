show keys from venta;

select * from empleado e
inner join puesto p
on e.id_puesto=p.id_puesto;

select * from puesto p
left join empleado e
on p.id_puesto=e.id_puesto;

select * from empleado e
right join puesto p
on e.id_puesto=p.id_puesto;

-- ¿Cuál es el nombre de los empleados que realizaron cada venta?
select * from empleado e
inner join venta v
on e.id_empleado=v.id_empleado;

-- ¿Cuál es el nombre de los artículos que se han vendido?
select * from articulo a
inner join venta v
on a.id_articulo=v.id_articulo;

-- ¿Cuál es el total de cada venta?
select v.clave,sum(a.precio) from articulo a
inner join venta v
on v.id_articulo=a.id_articulo
group by v.clave;

-- creacion de vistas
create view JDATickets as
(SELECT v.clave, v.fecha, a.nombre producto, a.precio, 
concat(e.nombre, ' ', e.apellido_paterno) empleado 
FROM venta v
JOIN empleado e
  ON v.id_empleado = e.id_empleado
JOIN articulo a
  ON v.id_articulo = a.id_articulo);
  
-- llamar una vista
SELECT 
    *
FROM
    JDATickets
ORDER BY fecha DESC;

select clave, round(sum(precio), 2) as total
from JDATickets
group by clave;

-- Obtener el puesto de un empleado.
select * from empleado;
create view JDAPuestoEmpleado as
(select e.nombre, e.apellido_paterno,e.apellido_materno,p.nombre as puesto
from empleado e
inner join puesto p
on p.id_puesto=e.id_puesto);
select * from JDAPuestoEmpleado;

-- Saber qué artículos ha vendido cada empleado.
create view JDAArticulosVendidos as
(select concat(e.nombre,' ',e.apellido_paterno) as nombre,
(select nombre from articulo where id_articulo=v.id_articulo) as articulo
from empleado e
inner join venta v
on e.id_empleado=v.id_empleado
order by nombre);

select * from JDAArticulosVendidos;

-- Saber qué puesto ha tenido más ventas.
create view JDAMasVentas as
(select (select nombre from puesto where id_puesto=e.id_puesto) as puesto, 
count((select nombre from puesto where id_puesto=e.id_puesto)) as ventas
from empleado e
inner join venta v
on e.id_empleado=v.id_empleado
group by puesto
order by ventas desc);

select * from JDAMasVentas;

-- 1 
-- Obten el código de producto, nombre de producto y descripción de todos los productos.
select productcode,productname,productdescription
from products;

-- 2
-- Obten el número de orden, estado y costo total de cada orden.
select o.ordernumber,o.status,sum(od.priceeach)
from orders o
right join orderdetails as od
on o.ordernumber=od.ordernumber
group by o.ordernumber;
-- 3
-- Obten el número de orden, fecha de orden, línea de orden, nombre del producto, 
-- cantidad ordenada y precio de cada pieza que muestre los detalles de cada orden.
select * from orders;
select * from orderdetails;
select * from products;
select o.ordernumber,o.orderdate,od.orderlinenumber,
(select productname from products where productcode=od.productcode) as productname,
od.quantityordered,od.priceeach
from orders o
right join orderdetails as od
on o.ordernumber=od.ordernumber;

-- 4
-- Obtén el número de orden, nombre del producto, el precio sugerido de fábrica (msrp) 
-- y precio de cada pieza.
select o.ordernumber,


