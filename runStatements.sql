--Query 1 Producto más vendido por mes el 2021.

WITH ventas_por_producto AS ( /*tabla temporal ventas_por_producto */
	SELECT v.mes, 
		p.nombre AS producto,
		COUNT(*) AS total_vendido
	FROM venta v
	JOIN producto_venta pv ON v.id_venta = pv.id_venta /*obtener productos asociados a cada venta*/
	JOIN producto p ON pv.id_producto = p.id_producto /*obtener el nombre del producto*/
	WHERE v.anio = 2021 /*filtrar ventas del año 2021*/
	GROUP BY v.mes, p.nombre
	
)
SELECT mes, producto, total_vendido
FROM (
    SELECT 
        mes,
        producto,
        total_vendido,
        RANK() OVER (PARTITION BY mes ORDER BY total_vendido DESC) AS ranking
    FROM ventas_por_producto
) AS ranked
WHERE ranking = 1
ORDER BY array_position(
	ARRAY['Enero','Febrero','Marzo', 'Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
	mes
);


-- Query 2, Producto mas economico por tienda.
SELECT DISTINCT ON (t.id_tienda) 
       t.nombre AS tienda,
       p.nombre AS producto,
       p.precio
FROM tienda t
INNER JOIN venta v ON v.id_tienda = t.id_tienda
INNER JOIN producto_venta pv ON pv.id_venta = v.id_venta
INNER JOIN producto p ON p.id_producto = pv.id_producto
ORDER BY t.id_tienda, p.precio ASC;

-- Query 7, El vendedor que ha recaudado más dinero para la tienda por año.
SELECT DISTINCT ON (t.id_tienda, v.anio)
		t.nombre AS tienda,
		v.anio,
		em.nombre AS vendedor,
		SUM(p.precio) AS total_ventas
FROM tienda t 
INNER JOIN venta v ON v.id_tienda = t.id_tienda
INNER JOIN producto_venta pv ON pv.id_venta = v.id_venta
INNER JOIN producto p ON p.id_producto = pv.id_producto
INNER JOIN empleado em ON em.id_empleado = v.id_empleado
GROUP BY t.id_tienda, t.nombre, v.anio, em.id_empleado, em.nombre
ORDER BY t.id_tienda, v.anio, SUM(p.precio) DESC, em.nombre;
