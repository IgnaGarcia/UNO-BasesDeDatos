﻿-- O) Listar el numero, nombre, apellido y el total facturado de los clientes que 
--    hayan gastado mas de $150 durante el mes de mayo de 2010.

SELECT C.NROCLI, C.NYAPE, SUM(CANTIDAD*PRECIOUNI) TOTAL
FROM CLIENTES C INNER JOIN FACTURAS F ON C.NROCLI = F.CLIENTE
	INNER JOIN DETALLES D ON F.NROFACTURA = D.NROFACTURA
WHERE FECHA BETWEEN '2010-5-1' AND '2010-5-31'
GROUP BY NROCLI
HAVING SUM(CANTIDAD*PRECIOUNI) > (SELECT SUM(CANTIDAD*PRECIOUNI) TOTAL
	FROM CLIENTES C1 INNER JOIN FACTURAS F1 ON C1.NROCLI = F1.CLIENTE
		INNER JOIN DETALLES D1 ON F1.NROFACTURA = D1.NROFACTURA
	WHERE C.NROCLI=C1.NROCLI AND FECHA BETWEEN '2010-4-1' AND '2010-4-30')