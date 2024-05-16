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
VALUE
('1','Televisor LED 4K','799.99','1'),
('2','Laptop HP','899.99','1'),
('3','Camiseta de algondón','19.99','2'),
('4','Sofá de cuero','999.99','3'),
('5','Lámpara de mesa','29.99','4');

Una vez finalizada la ejecución de las  cuatro query, debería verse así:


![DB_creada](https://github.com/adrianpy-ism/SQL-operaciones-avanzadas/assets/60670785/e2b40372-f3a6-440a-8e4b-cc6887549529)



Con estas cuatro dimensiones creadas dentro de la base de datos: comercioelectrónico, avenzamos en la ejecución de operaciones de un escenario ideal:

1 - Mostramos el nombre del producto y el precio de todos los productos de la categoría "Electrónica". Para esto relacionaremos dos tablas mediante inner join 

SELECT productos.nombre, precio FROM comercioelectronico.productos
inner join categorias on productos.id_categoria=categorias.id_categoria
where categorias.nombre = 'Electrónica';

Resultado:
![01](https://github.com/adrianpy-ism/SQL-operaciones-avanzadas/assets/60670785/a3e4c388-d10b-411b-aa4e-d581ccc60eab)

