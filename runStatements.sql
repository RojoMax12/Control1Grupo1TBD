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

--Query 4, Empleado que ganó más por tienda en 2020, indicando la comuna donde vive y el cargo que tiene en la empresa.

SELECT 
    e.id_empleado,
    e.nombre AS empleado,
    e.cargo,
    c.nombre AS comuna,
    COUNT(DISTINCT v.id_venta) AS total_ventas,
    SUM(p.precio) AS recaudacion,
    v.anio
FROM empleado e
JOIN comuna c ON e.id_comuna = c.id_comuna
JOIN tienda_empleado te ON e.id_empleado = te.id_empleado
JOIN tienda t ON te.id_tienda = t.id_tienda
JOIN venta v ON t.id_tienda = v.id_tienda AND e.id_empleado = v.id_empleado
JOIN producto_venta pv ON pv.id_venta = v.id_venta
JOIN producto p ON p.id_producto = pv.id_producto
WHERE v.anio = 2020
GROUP BY e.id_empleado, e.nombre, e.cargo, c.nombre, v.anio
ORDER BY total_ventas DESC, recaudacion DESC
LIMIT 1;

--Query 5, La tienda que tiene menos empleados.
SELECT nombre, cant_empleados
FROM (
	SELECT TE.id_tienda, T.nombre,
	COUNT (TE.id_empleado) AS cant_empleados,
	RANK () OVER (ORDER BY COUNT (TE.id_empleado) ASC) AS rnk
	FROM tienda_empleado TE
	JOIN tienda T ON TE.id_tienda = T.id_tienda
	GROUP BY TE.id_tienda, T.nombre
) AS X
WHERE rnk = 1;


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

-- Query 9, El empleado con mayor sueldo por mes.

SELECT nombre, mes, valor FROM empleado as e
	INNER JOIN sueldo as s ON s.id_empleado = e.id_empleado
	ORDER BY s.valor DESC LIMIT 1


--Query 10, La tienda con menor recaudación por mes.
--SEPARADO POR AÑO Y MES.

SELECT anio, mes, nombre_tienda, recaudacion
FROM (
	SELECT V.mes, V.anio, T.id_tienda, T.nombre AS nombre_tienda,
    	SUM(P.precio) AS recaudacion,
		RANK() OVER (PARTITION BY V.mes, V.anio ORDER BY SUM(P.precio) ASC) AS rnk
	FROM venta V
	JOIN tienda T ON V.id_tienda = T.id_tienda
	JOIN producto_venta PV ON V.id_venta = PV.id_venta
	JOIN producto P ON PV.id_producto = P.id_producto
	GROUP BY V.mes, V.anio, T.id_tienda, T.nombre
	) AS Z
WHERE rnk = 1
ORDER BY anio,
	CASE LOWER(mes)
		WHEN 'enero' THEN 1
	WHEN 'febrero' THEN 2
	WHEN 'marzo' THEN 3
	WHEN 'abril' THEN 4
	WHEN 'mayo' THEN 5
	WHEN 'junio' THEN 6
	WHEN 'julio' THEN 7
	WHEN 'agosto' THEN 8
	WHEN 'septiembre' THEN 9
	WHEN 'octubre' THEN 10
	WHEN 'noviembre' THEN 11
	WHEN 'diciembre' THEN 12
END;


--Query 10, La tienda con menor recaudación por mes.
--SEPARADO SOLO POR MES.
SELECT mes, nombre_tienda, recaudacion
FROM (
	SELECT V.mes, T.id_tienda, T.nombre AS nombre_tienda,
    	SUM(P.precio) AS recaudacion,
		RANK() OVER (PARTITION BY V.mes ORDER BY SUM(P.precio) ASC) AS rnk
	FROM venta V
	JOIN tienda T ON V.id_tienda = T.id_tienda
	JOIN producto_venta PV ON V.id_venta = PV.id_venta
	JOIN producto P ON PV.id_producto = P.id_producto
	GROUP BY V.mes, T.id_tienda, T.nombre
	) AS Z
WHERE rnk = 1
ORDER BY
	CASE LOWER(mes)
		WHEN 'enero' THEN 1
	WHEN 'febrero' THEN 2
	WHEN 'marzo' THEN 3
	WHEN 'abril' THEN 4
	WHEN 'mayo' THEN 5
	WHEN 'junio' THEN 6
	WHEN 'julio' THEN 7
	WHEN 'agosto' THEN 8
	WHEN 'septiembre' THEN 9
	WHEN 'octubre' THEN 10
	WHEN 'noviembre' THEN 11
	WHEN 'diciembre' THEN 12
END;