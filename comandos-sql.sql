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
    PRIMERA_COMPRA BIT
    
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
# Eliminar una tabla.
  DROP TABLE TBCLIENTES;

  
