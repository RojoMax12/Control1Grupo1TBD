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

