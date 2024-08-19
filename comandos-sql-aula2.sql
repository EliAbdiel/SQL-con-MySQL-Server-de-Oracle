# Algunos de los comados SQL vistos en el aula 2

USE jugos_ventas;

SELECT * FROM tabla_de_clientes;

SELECT DNI, NOMBRE FROM tabla_de_clientes;

SELECT DNI AS identificación, NOMBRE AS cliente FROM tabla_de_clientes;

SELECT * FROM tabla_de_productos WHERE SABOR = 'Uva';

SELECT * FROM tabla_de_productos WHERE ENVASE = 'botella PET';

SELECT * FROM tabla_de_productos WHERE PRECIO_DE_LISTA > 16;

SELECT * FROM tabla_de_productos WHERE PRECIO_DE_LISTA <= 16;

SELECT * FROM tabla_de_productos WHERE PRECIO_DE_LISTA BETWEEN 16 AND 16.02;

/* CONSULTAS CONDICIONALES */

SELECT * FROM tabla_de_productos;

SELECT * FROM tabla_de_productos WHERE sabor = 'mango' AND TAMAÑO = '470 ml';

SELECT * FROM tabla_de_productos WHERE sabor = 'mango' OR TAMAÑO = '470 ml';

SELECT * FROM tabla_de_productos WHERE NOT (SABOR= 'mango' AND TAMAÑO = '470 ml');

SELECT * FROM tabla_de_productos WHERE SABOR= 'mango' AND NOT TAMAÑO= '470 ml';

SELECT * FROM tabla_de_productos WHERE SABOR IN ('MANGO', 'UVA');

SELECT * FROM tabla_de_productos WHERE SABOR = 'MANGO' OR SABOR = 'UVA';

SELECT * FROM tabla_de_clientes WHERE CIUDAD IN ('ciudad de México', 'Guadalajara');

SELECT * FROM tabla_de_clientes WHERE CIUDAD = 'ciudad de México' OR CIUDAD = 'Guadalajara';

SELECT * FROM tabla_de_clientes WHERE CIUDAD IN ('Guadalajara') AND EDAD > 21;

SELECT * FROM tabla_de_clientes WHERE CIUDAD IN ('ciudad de México', 'Guadalajara') AND EDAD BETWEEN 20 AND 25;

SELECT * FROM tabla_de_clientes WHERE CIUDAD IN ('ciudad de México', 'Guadalajara') AND (EDAD BETWEEN 20 AND 25);

/*CONSULTAS LIKE, el símbolo % representa cualquier cantidad de caracteres*/

SELECT * FROM tabla_de_productos WHERE SABOR LIKE '%manzana%';

SELECT * FROM tabla_de_productos WHERE SABOR LIKE '%manzana%' AND ENVASE = 'Botella PET';

SELECT * FROM tabla_de_clientes WHERE NOMBRE LIKE '%ez';

/*REGISTROS UNICOS*/

SELECT DISTINCT ENVASE, TAMAÑO FROM tabla_de_productos;

SELECT DISTINCT ENVASE, TAMAÑO, SABOR FROM tabla_de_productos WHERE SABOR = 'Naranja';

SELECT DISTINCT BARRIO FROM tabla_de_clientes WHERE CIUDAD = 'Ciudad de México';

/*LIMIT nos permite limitar el número de registros*/

SELECT * FROM tabla_de_productos LIMIT 5;

SELECT * FROM tabla_de_productos LIMIT 5,4; /*muestra 4 registros comenzando desde el registro número 5*/

SELECT * FROM facturas  WHERE FECHA_VENTA = '2017-01-01' LIMIT 10;

/*ORDER BY, ordena los resultados de nuestras consultas SQL*/

SELECT * FROM tabla_de_productos ORDER BY PRECIO_DE_LISTA;

SELECT * FROM tabla_de_productos ORDER BY PRECIO_DE_LISTA DESC;

SELECT * FROM tabla_de_productos ORDER BY NOMBRE_DEL_PRODUCTO;

SELECT * FROM tabla_de_productos ORDER BY NOMBRE_DEL_PRODUCTO DESC;

SELECT * FROM tabla_de_productos ORDER BY ENVASE ASC, NOMBRE_DEL_PRODUCTO DESC;

SELECT * FROM tabla_de_productos ORDER BY ENVASE DESC, NOMBRE_DEL_PRODUCTO ASC;

/*GROUP BY en SQL, permite agrupar filas de una tabla según un criterio específico*/

SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS LIMITE_TOTAL
FROM tabla_de_clientes
GROUP BY ESTADO;

SELECT ENVASE, MAX(PRECIO_DE_LISTA) AS MAYOR_PRECIO
FROM tabla_de_productos
GROUP BY ENVASE;

SELECT ENVASE, COUNT(*)
FROM tabla_de_productos
GROUP BY ENVASE;

SELECT BARRIO, SUM(LIMITE_DE_CREDITO) AS LIMITE
FROM tabla_de_clientes
GROUP BY BARRIO;

SELECT BARRIO, SUM(LIMITE_DE_CREDITO) AS LIMITE
FROM tabla_de_clientes
WHERE CIUDAD = 'CIUDAD DE MÉXICO'
GROUP BY BARRIO;

SELECT CIUDAD, BARRIO, SUM(LIMITE_DE_CREDITO) AS LIMITE
FROM tabla_de_clientes
WHERE CIUDAD = 'CIUDAD DE MÉXICO'
GROUP BY BARRIO, CIUDAD;

SELECT ESTADO, BARRIO, SUM(LIMITE_DE_CREDITO) AS LIMITE
FROM tabla_de_clientes
WHERE CIUDAD = 'CIUDAD DE MÉXICO'
GROUP BY ESTADO, BARRIO;

SELECT ESTADO, BARRIO, MAX(LIMITE_DE_CREDITO) AS LIMITE, EDAD
FROM tabla_de_clientes
WHERE EDAD >= 20
GROUP BY ESTADO, BARRIO
ORDER BY EDAD;

/*HAVING en SQL, es un filtro que se aplica a los resultados de una agregación*/

SELECT ESTADO, SUM(LIMITE_TOTAL) AS SUMA_LIMITE_TOTAL
FROM tabla_de_clientes
GROUP BY ESTADO
HAVING SUM(LIMITE_TOTAL) > 300000;

SELECT ENVASE, MAX(PRECIO_DE_LISTA) AS PRECIO_MAXIMO, MIN(PRECIO_DE_LISTA) AS PRECIO_MINIMO, SUM(PRECIO_DE_LISTA) AS SUMA_PRECIO
FROM tabla_de_productos
GROUP BY ENVASE
HAVING SUM(PRECIO_DE_LISTA) > 80;

SELECT ENVASE, MAX(PRECIO_DE_LISTA) AS PRECIO_MAXIMO, MIN(PRECIO_DE_LISTA) AS PRECIO_MINIMO, SUM(PRECIO_DE_LISTA) AS SUMA_PRECIO
FROM tabla_de_productos
GROUP BY ENVASE
HAVING SUM(PRECIO_DE_LISTA) > 80 AND MAX(PRECIO_DE_LISTA) >= 5;

SELECT DNI, COUNT(*) FROM facturas
WHERE YEAR(FECHA_VENTA) = 2016
GROUP BY DNI
HAVING COUNT(*) > 2000;

/*CASE, permite evaluar condiciones y devolver un valor según el resultado.*/

SELECT NOMBRE_DEL_PRODUCTO, 
       PRECIO_DE_LISTA,
       CASE 
           WHEN PRECIO_DE_LISTA >= 12 THEN 'Costoso'
           WHEN PRECIO_DE_LISTA >= 5 AND PRECIO_DE_LISTA < 12 THEN 'Asequible'
           ELSE 'Barato'
       END AS PRECIO
FROM tabla_de_productos;

SELECT ENVASE, 
       SABOR,
       CASE 
           WHEN PRECIO_DE_LISTA >= 12 THEN 'Costoso'
           WHEN PRECIO_DE_LISTA >= 5 AND PRECIO_DE_LISTA < 12 THEN 'Asequible'
           ELSE 'Barato'
       END AS PRECIO,
       MIN(PRECIO_DE_LISTA) AS PRECIO_MINIMO
FROM tabla_de_productos
WHERE TAMAÑO = '700 ml'
GROUP BY ENVASE, SABOR, PRECIO
ORDER BY ENVASE;

SELECT NOMBRE,
CASE 
    WHEN YEAR(fecha_de_nacimiento) < 1990 THEN 'Viejos'
    WHEN YEAR(fecha_de_nacimiento) >= 1990 
    AND YEAR(fecha_de_nacimiento) <= 1995 THEN 'Jóvenes' 
    ELSE 'Niños' 
END AS CLASIFICACION_EDAD
FROM tabla_de_clientes;

/*Los JOINs, una herramienta para combinar datos de diferentes tablas*/

/*INNER JOIN: Devuelve solo los registros que tienen coincidencias en ambas tablas. 
  Es el más utilizado.*/
SELECT A.NOMBRE, B.HOBBY
FROM tabla_de_izquierda A
INNER JOIN tabla_de_derecha B
ON A.ID = B.ID;

/*LEFT JOIN: Devuelve todos los registros de la tabla izquierda 
y solo los registros coincidentes de la tabla derecha.*/
SELECT A.NOMBRE, B.HOBBY
FROM tabla_de_izquierda A
LEFT JOIN tabla_de_derecha B
ON A.ID = B.ID;

/*RIGHT JOIN: Devuelve todos los registros de la tabla derecha 
  y solo los registros coincidentes de la tabla izquierda.*/
SELECT A.NOMBRE, B.HOBBY
FROM tabla_de_izquierda A
RIGHT JOIN tabla_de_derecha B
ON A.ID = B.ID;

/*FULL JOIN: Devuelve todos los registros de ambas tablas
  , incluyendo los que no tienen coincidencias.*/
SELECT A.NOMBRE, B.HOBBY
FROM tabla_de_izquierda A
FULL JOIN tabla_de_derecha B
ON A.ID = B.ID;

/*CROSS JOIN: Devuelve el producto cartesiano de ambas tablas, es decir
  , todas las posibles combinaciones de registros.*/
SELECT A.NOMBRE, B.HOBBY
FROM tabla_de_izquierda A
CROSS JOIN tabla_de_derecha B;

SELECT YEAR(FECHA_VENTA), SUM(CANTIDAD * PRECIO) AS FACTURACION
FROM facturas F 
INNER JOIN 
items_facturas IFa 
ON F.NUMERO = IFa.NUMERO
GROUP BY YEAR(FECHA_VENTA);

/*muestra clientes que han comprado*/
SELECT A.DNI, A.NOMBRE, B.DNI
FROM tabla_de_clientes A
INNER JOIN facturas B ON A.DNI = B.DNI;

/*muestra clientes que no han comprado*/
SELECT A.DNI, A.NOMBRE, A.CIUDAD, B.DNI
FROM tabla_de_clientes A
LEFT JOIN facturas B ON A.DNI = B.DNI;

/*muestra clientes que no han comprado con WHERE*/
SELECT A.DNI, A.NOMBRE, A.CIUDAD, B.DNI
FROM tabla_de_clientes A
LEFT JOIN facturas B ON A.DNI = B.DNI
WHERE B.DNI IS NULL;

SELECT B.DNI, B.NOMBRE, B.CIUDAD, A.DNI
FROM tabla_de_clientes A
RIGHT JOIN facturas B ON A.DNI = B.DNI
WHERE A.DNI IS NULL;

/*muestra clientes, barrios y vendedores que atienden en el mismo barrio*/
SELECT 
    tabla_de_clientes.NOMBRE,
    tabla_de_clientes.BARRIO,
    tabla_de_vendedores.NOMBRE,
    tabla_de_vendedores.BARRIO
FROM 
    tabla_de_clientes
INNER JOIN 
    tabla_de_vendedores ON tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO;

/*alias para mostrar clientes, barrios y vendedores que atienden en el mismo barrio*/
SELECT 
    c.NOMBRE,
    c.BARRIO,
    v.NOMBRE,
    v.BARRIO
FROM 
    tabla_de_clientes c
INNER JOIN 
    tabla_de_vendedores v ON c.BARRIO = v.BARRIO;

/*mostrar clientes, barrios, vendedores que atienden en el mismo barrio 
  y la ciudad del cliente*/
SELECT 
    c.NOMBRE,
    c.BARRIO,
    c.CIUDAD,
    v.NOMBRE,
    v.BARRIO
FROM 
    tabla_de_clientes c
INNER JOIN 
    tabla_de_vendedores v ON c.BARRIO = v.BARRIO;

/*mostrar todos los clientes, sus barrios, ciudades 
  y los vendedores que los atienden (si los hay)*/
SELECT 
    c.NOMBRE,
    c.BARRIO,
    c.CIUDAD,
    v.NOMBRE
FROM 
    tabla_de_clientes c
LEFT JOIN 
    tabla_de_vendedores v ON c.BARRIO = v.BARRIO;

/*mostrar todos los vendedores, sus barrios y los clientes 
  que atienden (si los hay)*/
SELECT 
    c.NOMBRE,
    v.NOMBRE,
    v.BARRIO
FROM 
    tabla_de_clientes c
RIGHT JOIN 
    tabla_de_vendedores v ON c.BARRIO = v.BARRIO;

/* mostrar clientes, barrios, ciudades, vendedores y sus vacaciones, 
   solo si el barrio del cliente es igual al barrio del vendedor*/
SELECT 
    c.NOMBRE,
    c.BARRIO,
    c.CIUDAD,
    v.NOMBRE,
    v.VACACIONES
FROM 
    tabla_de_clientes c, tabla_de_vendedores v;

/*UNION: Combina resultados de consultas, eliminando duplicados*/

SELECT DISTINCT BARRIO FROM tabla_de_clientes;
UNION
SELECT DISTINCT BARRIO FROM tabla_de_vendedores;

/*une información de clientes y vendedores, 
incluyendo el nombre, barrio y tipo (cliente o vendedor)*/
SELECT BARRIO, NOMBRE, 'Cliente' AS TIPO FROM tabla_de_clientes
UNION
SELECT BARRIO, NOMBRE, 'Vendedor' AS TIPO FROM tabla_de_vendedores;

/*realia un FULL JOIN utilizando LEFT JOIN y RIGHT JOIN con UNION*/
SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.CIUDAD, tabla_de_clientes.BARRIO, tabla_de_vendedores.NOMBRE AS VENDEDOR
FROM tabla_de_clientes
LEFT JOIN tabla_de_vendedores ON tabla_de_clientes.ID = tabla_de_vendedores.ID_CLIENTE
UNION
SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.CIUDAD, tabla_de_clientes.BARRIO, tabla_de_vendedores.NOMBRE AS VENDEDOR
FROM tabla_de_clientes
RIGHT JOIN tabla_de_vendedores ON tabla_de_clientes.ID = tabla_de_vendedores.ID_CLIENTE;

/*UNION ALL: Combina resultados de consultas, incluyendo todos los registros, incluso los duplicados*/

SELECT DISTINCT BARRIO FROM tabla_de_clientes;
UNION ALL
SELECT DISTINCT BARRIO FROM tabla_de_vendedores;

/*SUBCONSULTAS: consultas que se ejecutan dentro de otra consulta*/

SELECT DISTINCT BARRIO FROM tabla_de_vendedores;
SELECT * FROM tabla_de_clientes WHERE BARRIO IN ('Condesa', 'Del Valle', 'Contadero', 'Oblatos');
/*Imagina que la tabla tabla_de_vendedores tiene los siguientes barrios:

Condesa
Del Valle
Contadero
Y la tabla tabla_de_clientes tiene los siguientes barrios:

Condesa
Del Valle
Roma
Polanco
El script SQL seleccionará solo los clientes que viven en Condesa o Del Valle, 
ya que estos son los barrios que también están en la tabla tabla_de_vendedores.*/
SELECT * FROM tabla_de_clientes WHERE BARRIO IN (
       SELECT DISTINCT BARRIO FROM tabla_de_vendedores
       );
/*el script completo selecciona el tipo de envase y el precio máximo de cada envase, 
pero solo muestra aquellos envases cuyo precio máximo es mayor o igual a 10.*/
SELECT ENVASE, MAX(PRECIO_DE_LISTA) as PRECIO_MAXIMO FROM tabla_de_productos GROUP BY ENVASE;
SELECT X.ENVASE, X.PRECIO_MAXIMO FROM (
       SELECT ENVASE, MAX(PRECIO_DE_LISTA) as PRECIO_MAXIMO FROM tabla_de_productos GROUP BY ENVASE) X 
       WHERE X.PRECIO_MAXIMO >= 10;
/*ejemplo: la subconsulta que sería equivalente a*/
SELECT DNI, COUNT(*) FROM facturas
WHERE YEAR(FECHA_VENTA) = 2016
GROUP BY DNI
HAVING COUNT(*) > 2000;
/****/
SELECT X.DNI, X.CONTADOR FROM 
(SELECT DNI, COUNT(*) AS CONTADOR FROM facturas
WHERE YEAR(FECHA_VENTA) = 2016
GROUP BY DNI) X WHERE X.CONTADOR > 2000;

/* VIEWS*/

/*Consulta para crear la View 'vw_envases_grandes'*/
CREATE VIEW vw_envases_grandes AS
SELECT ENVASE, MAX(PRECIO_DE_LISTA) AS PRECIO_MAXIMO
FROM tabla_de_productos
GROUP BY ENVASE;
/*Consulta para obtener los envases con precio máximo mayor a 10*/
SELECT X.ENVASE, X.PRECIO_MAXIMO
FROM vw_envases_grandes X
WHERE PRECIO_MAXIMO >= 10;
/*Consulta para obtener el precio de lista, precio máximo y porcentaje de variación*/
SELECT 
    A.NOMBRE_DEL_PRODUCTO, 
    A.ENVASE, 
    A.PRECIO_DE_LISTA, 
    B.PRECIO_MAXIMO,
    ( (B.PRECIO_MAXIMO  A.PRECIO_DE_LISTA) / B.PRECIO_MAXIMO ) * 100 AS PORCENTAJE_DE_VARIACION
FROM 
    tabla_de_productos A
INNER JOIN 
    vw_envases_grandes B ON A.ENVASE = B.ENVASE;

/* FUNCIONES STRING */

SELECT LTRIM("    MySQL es fácil");

SELECT RTRIM("MySQL es fácil    ");

SELECT TRIM("    MySQL es fácil    ");

SELECT CONCAT("MySQL es fácil,", " no lo crees?");

SELECT UPPER("mysql es una base de datos interesante.");

SELECT LOWER("MYSQL ES UNA BASE DE DATOS INTERESANTE.");

SELECT SUBSTRING("mysql es una base de datos interesante.", 14,4);

SELECT CONCAT(NOMBRE, " ", DNI) FROM tabla_de_clientes;

/* FUNCIONES DATE */

SELECT CURDATE();

SELECT current_timestamp();

SELECT YEAR(current_timestamp());

SELECT MONTH(current_timestamp());

SELECT DAY(current_timestamp());

SELECT MONTHNAME(current_timestamp());

SELECT DAYNAME(current_timestamp());

SELECT DATEDIFF(current_timestamp(), "2021-01-01") AS DIFERENCIA_DE_DIAS;

SELECT DATEDIFF(current_timestamp(), "1984-06-20") AS DIFERENCIA_DE_DIAS;

SELECT current_timestamp() AS DIA_HOY, 
DATE_SUB(current_timestamp(), INTERVAL 1 MONTH) AS RESULTADO;

SELECT DISTINCT FECHA_VENTA,
DAYNAME(FECHA_VENTA) AS DIA, MONTHNAME(FECHA_VENTA) AS MES, 
YEAR(FECHA_VENTA) AS AÑO FROM facturas;

/* FUNCIONES MATEMÁTICAS */

SELECT (34+346-67)/15 * 29 AS RESULTADO;

SELECT CEILING (23.1222);

SELECT FLOOR (23.999999);

SELECT RAND() AS RESULTADO;

SELECT ROUND(254.545,2);

SELECT ROUND(254.545,1);

SELECT NUMERO, CANTIDAD, PRECIO, 
CANTIDAD * PRECIO AS FACTURACIÓN FROM items_facturas;

SELECT NUMERO, CANTIDAD, PRECIO, 
ROUND(CANTIDAD * PRECIO,2) AS FACTURACIÓN FROM items_facturas;

/* FUNCIONES CONVERSIÓN */

SELECT CURRENT_TIMESTAMP() AS RESULTADO;

SELECT CONCAT("La fecha y la hora de hoy son: ", CURRENT_TIMESTAMP()) AS RESULTADO;

SELECT CONCAT("La fecha y el horario son: ",
DATE_FORMAT(CURRENT_TIMESTAMP(),"%W, %d/%m/%Y a las %T" )) AS RESULTADO;

SELECT CONVERT(23.45, CHAR) AS RESULTADO;

SELECT SUBSTRING(CONVERT(23.45, CHAR),3,1) AS RESULTADO;
