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
            <div class="col-md-12">
                <h1>
                    Usuarios en el sistema
                    <a href="/Prueba3progra2/views/users/new.jsp" class="pull-right btn btn-success">Crear Usuario</a>
                </h1>
                <hr />
            </div>
            
            <div class="col-md-12">
               
                <table class="table table-striped table-bordered">
                    <thead>
                        <th>ID</th>
                        <th>Nombre de Usuario</th>
                        <th>Fecha de Nacimiento</th>
                        <th>Acciones</th>
                    </thead>
                    
                    <tbody>
                    <!-- esto es el loop -->
                    </tbody>
                    
                </table>
  
            </div>
        </div>
    </div>
        
        <script type="text/javascript" src="assets/js/jquery-2.2.4.min.js"></script>
        <script type="text/javascript" src="assets/bootstrap.min.js"></script>
    </body>
</html>
