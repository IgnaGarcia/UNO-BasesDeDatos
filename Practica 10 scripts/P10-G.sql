-- G) Obtener las fechas en las que se hayan vendido mas de $200.- (Rsta: filas 9)
SELECT SUM(CANTIDAD * PRECIOUNI) IMPORTE
FROM FACTURAS F INNER JOIN DETALLES D ON F.NROFACTURA=D.NROFACTURA

GROUP BY FECHA
HAVING SUM(CANTIDAD * PRECIOUNI)> 200