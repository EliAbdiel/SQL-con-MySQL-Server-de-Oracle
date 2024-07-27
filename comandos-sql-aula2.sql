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

# Usando LIKE, el símbolo % representa cualquier cantidad de caracteres.

SELECT * FROM tabla_de_productos WHERE SABOR LIKE '%manzana%';

SELECT * FROM tabla_de_productos WHERE SABOR LIKE '%manzana%' AND ENVASE = 'Botella PET';

SELECT * FROM tabla_de_clientes WHERE NOMBRE LIKE '%ez';

