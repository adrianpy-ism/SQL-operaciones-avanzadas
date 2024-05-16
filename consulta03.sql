-- mostrar el nombre de los productos y la
-- fecha de los pedidos realizados por el cliente con el id_cliente igual a 1
-- ordenado por fecha descendente.

SELECT fecha, nombre FROM comercioelectronico.productos

inner join pedidos on productos.id_producto=pedidos.id_producto

where id_cliente = '1'

order by fecha ASC;

