-- mostrar los clientes que tengan gastos mayores a 1000 en el total de sus pedidos
-- para lo será necesario sumar precios, agrupar por nombres de clientes,
-- para saber el monto total de sus compras
-- y luego comparar si tienen compras superiores a 1000

SELECT clientes.nombre as nombre_cliente,
sum(productos.precio) as monto_total

FROM comercioelectronico.pedidos

inner join productos on pedidos.id_producto = productos.id_producto
inner join clientes on clientes.id_cliente = pedidos.id_cliente
GROUP BY nombre_cliente
having SUM(productos.precio) > 1000;

