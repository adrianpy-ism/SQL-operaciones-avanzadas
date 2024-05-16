-- Mostramos el nombre del producto y el precio de todos los productos de la categoría "Electrónica".

SELECT productos.nombre, precio FROM comercioelectronico.productos

inner join categorias on productos.id_categoria=categorias.id_categoria

where categorias.nombre = 'Electrónica';