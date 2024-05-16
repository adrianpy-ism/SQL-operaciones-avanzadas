-- Buscamos el producto más caro en la base de
-- datos y mostramos su nombre y precio
-- Usamos una condición dentro de where para seleccionar el precio máximo.

SELECT nombre, precio
FROM comercioelectronico.productos
WHERE precio = (SELECT MAX(precio) FROM comercioelectronico.productos);