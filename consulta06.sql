-- mostramos los productos(nombre_producto y precio)
-- cuyo precio es mayor que el precio promedio de todos los productos.
-- Recurrimos a una condición dentro de where para establecer un parámetro de comparación

-- SELECT nombre, FORMAT(AVG(precio), 2)
SELECT *
FROM comercioelectronico.productos
WHERE precio > (select FORMAT(AVG(precio), 2) from comercioelectronico.productos)