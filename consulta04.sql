-- Calculamos AVG el precio promedio de todos los
-- productos en la base de datos
-- y con Format restringimos a dos dígitos los decimales.

SELECT FORMAT(AVG(precio), 2)as precio_promedio
FROM comercioelectronico.productos;