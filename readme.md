<h1>Aplicación Biblioteca</h1>

Aplicación sencilla creada en vb.net para dar acceso a una base de datos con contenido de una biblioteca.

<h2><b>Requisitos de aplicación</b></h2>

Para que la aplicación funcione correctamente tendremos que añadir las bases de datos (ADMINISTRACION y BIBLIOTECA) que se adjuntan en el proyecto, a MSQLServer. 
La base de datos Administración guarda los datos de los usuarios que se podran conectar a la aplicación. Mientras que biblioteca es la base de datos que utilizaremos en la mayor parte de la aplicación.

Para el correcto funcionamiento de la aplicación, también hará falta crear la base de datos aspnet_regsql. 
Aspnet_regsql.exe se utiliza para crear la base de datos de SQL Server y para agregar o quitar opciones en una base de datos existente. Esto lo podremos hacer de forma automática de la siguiente forma:

La herramienta Aspnet_regsql.exe se encuentra en la carpeta drive:\WINDOWS\Microsoft.NET\Framework\versionNumber del servidor Web.
Abriremos símbolo de sistema y ejecutaremos los siguiente:
C:\WINDOWS\Microsoft.NET\Framework\<versionNumber>\aspnet_regsql.exe



