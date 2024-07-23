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

