# En esta aula te hablaremos sobre la historia de SQL y de MySQL.
# También instalaremos Workbench para poder utilizar un IDE en el desarrollo de nuestros ejercicios.
# Creando una base de datos.
  CREATE DATABASE jugos;
# Eiminando una base de datos.
  DROP DATABASE jugos;
  DROP SCHEMA jugos;
# Seleccionar base de datos existente.
  USE data_base;
# Agregar usuarios para administrar la base de datos en MySQL.
# acceder a MySQL por líneas del command prompt.
# c:\Program Files\MySQL\MySQL Server 8.0\bin
# mysql.exe -h localhost -u root -p. Teclea ENTER y después incluye la contraseña.
# debes reemplazar 'admin', 'password' y 'mydatabase' con el nombre de usuario, la contraseña 
# y el nombre de la base de datos que desees utilizar.
  CREATE USER 'admin'@'localhost' IDENTIFIED BY 'password';
  GRANT ALL PRIVILEGES ON mydatabase.* TO 'admin'@'localhost';
  FLUSH PRIVILEGES;
# Crear una tabla.
  USE jugos;
  CREATE TABLE TBCLIENTES (
    DNI VARCHAR(20),
    NOMBRE VARCHAR(150),
    DIRECCION1 VARCHAR(150),
    DIRECCION2 VARCHAR(150),
    BARRIO VARCHAR(50),
    CIUDAD VARCHAR(50),
    ESTADO VARCHAR(50),
    CP VARCHAR(10),
    EDAD SMALLINT,
    SEXO VARCHAR(1),
    LIMITE_CREDITO FLOAT,
    VOLUMEN_COMPRA FLOAT,
    PRIMERA_COMPRA BIT(1)
    
    );
  CREATE TABLE tbproductos (
    producto VARCHAR(20),
    nombre VARCHAR(150),
    envase VARCHAR(50),
    volumen VARCHAR(20),
    sabor VARCHAR(50),
    precio FLOAT
    
  );
  CREATE TABLE TABLA_DE_VENDEDORES (
    MATRICULA varchar(5), 
    NOMBRE varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, 
    PORCENTAJE_COMISION float
    
    );
# Cambiar el tipo de dato de una columna.
  ALTER TABLE nombre_tabla MODIFY nombre_columna INT;
# Cambiar el tamaño de una columna.
  ALTER TABLE nombre_tabla MODIFY nombre_columna VARCHAR(100);
# Añadir una nueva columna.
  ALTER TABLE tbclientes ADD COLUMN FECHA_NACIMIENTO DATE;
# Eliminar una tabla.
  DROP TABLE TBCLIENTES;
# Insertar registros en la tabla.
  INSERT INTO tbproductos (producto, nombre, envase, volumen, sabor, precio) 
  VALUES ('773912', 'clean', 'botella pet', '1 litro', 'naranja', 8.01);
  INSERT INTO TABLA_DE_VENDEDORES (MATRICULA, NOMBRE, PORCENTAJE_COMISION)
  VALUES ('00233', 'Joan Geraldo de la Fonseca', 0.10);
  INSERT INTO TABLA_DE_VENDEDORES (MATRICULA, NOMBRE, PORCENTAJE_COMISION)
  VALUES ('00235', 'Márcio Almeida Silva', 0.08);
  INSERT INTO TABLA_DE_VENDEDORES (MATRICULA, NOMBRE, PORCENTAJE_COMISION)
  VALUES ('00236', 'Cláudia Morais', 0.08);

  INSERT INTO tbclientes (DNI, nombre, direccion1, direccion2, barrio, ciudad, estado, CP, edad, sexo, limite_credito, volumen_compra, primera_compra, FECHA_NACIMIENTO) 
  VALUES ('456789548', 'Pedro el Escamoso', 'Calle del Sol, 25', '', 'Los Laureles', 'CDMX', 'México', '65784', 55, 'M', 1000000, 2000, 0, '1971-05-25');
# Actualiza el registro.
  # UPDATE nombre_de_la_tabla 
    SET nombre_de_la_columna = nuevo_valor 
    WHERE condición
  # Actualiza el registro con el producto '812829'
  UPDATE tbproductos
  SET producto = '812829', envase = 'lata'
  WHERE volumen = '350 ml';
  # Actualiza el registro con el producto '695594'
  UPDATE tbproductos
  SET precio = 18.51
  WHERE producto = '695594';
  # Actualiza el registro con el producto '1041119'
  UPDATE tbproductos
  SET sabor = 'Lima/Limón'
  WHERE producto = '1041119';
# Eliminar registros de una tabla.
  DELETE FROM tbproductos WHERE producto = '773912';
  DELETE FROM TABLA_DE_VENDEDORES WHERE MATRICULA = '00233';
# Incluir la clave primaria. 
  ALTER TABLE tbproductos
  ADD PRIMARY KEY (producto);
  ALTER TABLE tbclientes
  ADD PRIMARY KEY (DNI);


