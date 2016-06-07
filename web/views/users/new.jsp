<%-- 
    Document   : newuser
    Created on : 7/06/2016, 01:24:00 AM
    Author     : andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    
    <head>
        <title>Prueba 3 Programacion 2</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="/Prueba3progra2/assets/css/bootstrap.min.css" rel="stylesheet"> 
        <link href="/Prueba3progra2/assets/css/bootstrap-theme.min.css" rel="stylesheet">
    </head>
    
    <body style="padding-top:60px;">
            
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Menu Principal</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="#contact">Usuarios</a></li>
            <li><a href="#contact">Libros</a></li>
            <li><a href="#contact">Autores</a></li>
            <li><a href="#contact">Nacionalidades</a></li>
            
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
        
    <div class="container">
        
        <div class="row">
          
            <div class="col-md-4 col-md-push-4">
                <h1>Agregar usuario</h1>
                <hr/>
                <form action="/Prueba3progra2/createUser" method="post">
                    <div class="form-group">
                         <caption>Usuario</caption>
                         <input type="text" name="username" class="form-control" >
                    </div>

                    <div class="form-group">
                        <caption> Fecha de Nacimiento </caption>
                        <input type="text" name="birth_date" class="form-control" >
                    </div>

                    <div class="form-group">
                        <caption>Contraseña</caption>
                        <input type="text" name="password" class="form-control" >
                    </div>

                    <div class="form-group">
                        <input type="submit" value="Crear" class="btn btn-block btn-success" > 
                    </div>
                </form>
            </div>
        </div>
    </div>
        
        <script type="text/javascript" src="assets/js/jquery-2.2.4.min.js"></script>
        <script type="text/javascript" src="assets/bootstrap.min.js"></script>
    </body>
</html>
