# SQL-operaciones-avanzadas

Creamos una base de datos para luego ejecutar algunas operaciones que se consideran avanzadas.

Ejecutamos un script, creado en la app de work bench, que creará una base de datos llamadas comercioelctrónico, con cuatro tablas:

comercioelectronico.sql

Ahora procederemos a cargar datos en cada una de las dimensiones creadas:

1
INSERT INTO comercioelectronico.categorias (id_categoria, nombre)
VALUE ('1','Electrónica'), ('2','Ropa'), ('3','Muebles'), ('4','Hogar');

2

INSERT INTO comercioelectronico.clientes (id_cliente, nombre, email) 
VALUES ('1','Juan Pérez','juan@example.com'),
('2','María Rodríguez','maria@example.com'),
('3','Carlos López','carlos@example.com')

3

INSERT INTO comercioelectronico.pedidos(id_pedido, id_cliente, fecha, id_producto)
VALUE ('1','1','2023-10-10','1'),('2','2','2023-10-12','3'),('3','1','2023-10-15','4'),('4','3','2023-10-18','2');

4

INSERT INTO comercioelectronico.productos (`id_producto`,`nombre`,`precio`,`id_categoria`)
VALUE('1','Televisor LED 4K','799.99','1'),
('2','Laptop HP','899.99','1'),
('3','Camiseta de algondón','19.99','2'),
('4','Sofá de cuero','999.99','3'),
('5','Lámpara de mesa','29.99','4');

Una vez finalizada la ejecución de las  cuatro query, debería verse así:
![DB_creada](https://github.com/adrianpy-ism/SQL-operaciones-avanzadas/assets/60670785/e2b40372-f3a6-440a-8e4b-cc6887549529)



Con estas cuatro dimensiones creadas dentro de la base de datos: comercioelectrónico, avanzamos en la ejecución de operaciones de un escenario ideal:

1 - Mostramos el nombre del producto y el precio de todos los productos de la categoría "Electrónica". Para esto, relacionamos dos tablas mediante inner join 

SELECT productos.nombre, precio FROM comercioelectronico.productos
inner join categorias on productos.id_categoria=categorias.id_categoria
where categorias.nombre = 'Electrónica';

Resultado:



![01](https://github.com/adrianpy-ism/SQL-operaciones-avanzadas/assets/60670785/a3e4c388-d10b-411b-aa4e-d581ccc60eab)

2 - Contamos la cantidad de clientes de nuestra base de datos:

SELECT COUNT(id_cliente) as 'total_clientes'

FROM comercioelectronico.clientes;

Resultado:


![02](https://github.com/adrianpy-ism/SQL-operaciones-avanzadas/assets/60670785/f7e62b92-c889-4ff0-9249-669ba782f574)


3 - Mostrar el nombre de los productos y la fecha de los pedidos realizados por el cliente con el id_cliente igual a 1, ordenado por fecha descendente.

SELECT fecha, nombre FROM comercioelectronico.productos
inner join pedidos on productos.id_producto=pedidos.id_producto
where id_cliente = '1'
order by fecha ASC;

Resultado:



![03](https://github.com/adrianpy-ism/SQL-operaciones-avanzadas/assets/60670785/ce55d2ec-3000-48df-9513-135120cf9b30)

4 - Calculamos AVG, el precio promedio de todos los productos en la base de datos y con Format restringimos a dos dígitos los decimales.

SELECT FORMAT(AVG(precio), 2)as precio_promedio
FROM comercioelectronico.productos;

Resultado:

![04](https://github.com/adrianpy-ism/SQL-operaciones-avanzadas/assets/60670785/b36c4636-5ab0-4858-b4e2-59e5485e9778)


5 - Buscamos el producto más caro en la base de datos y mostramos su nombre y su precio. Usamos una condición dentro de where para seleccionar el precio máximo.

SELECT nombre, precio FROM comercioelectronico.productos
WHERE precio = (SELECT MAX(precio) FROM comercioelectronico.productos);

Resultado:

![05](https://github.com/adrianpy-ism/SQL-operaciones-avanzadas/assets/60670785/001ddfdb-3502-41b0-8435-a1d3c4179926)

6 - Mostramos los productos(nombre_producto y precio), cuyo precio es mayor que el precio promedio de todos los productos.
Recurrimos a una condición dentro de where para establecer un parámetro de comparación.

SELECT *
FROM comercioelectronico.productos
WHERE precio > (select FORMAT(AVG(precio), 2) from comercioelectronico.productos)

Resultado:

![06](https://github.com/adrianpy-ism/SQL-operaciones-avanzadas/assets/60670785/ad942f92-6fc8-4194-a984-0bd64a85c149)

7 - Por último, mostramos los clientes que tienen gastos mayores a 1000 en el total de sus pedidos.
Para esto, es necesario sumar precios, agrupar por nombres de clientes; y para saber el monto total de sus compras y, luego comparar si tienen compras superiores a 1000. Para realizar esta tarea se recurrirá a relacionar las tablas con inner join.

SELECT clientes.nombre as nombre_cliente,
sum(productos.precio) as monto_total

FROM comercioelectronico.pedidos

inner join productos on pedidos.id_producto = productos.id_producto
inner join clientes on clientes.id_cliente = pedidos.id_cliente
GROUP BY nombre_cliente
having SUM(productos.precio) > 1000;

Resultado:

![07](https://github.com/adrianpy-ism/SQL-operaciones-avanzadas/assets/60670785/8ac5cd10-03cd-48c3-8790-de1d549789b8)


