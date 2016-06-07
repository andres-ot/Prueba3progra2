<%-- 
    Document   : login
    Created on : 07-jun-2016, 2:45:55
    Author     : fabian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    
    <head>
        <title>Prueba 3 Programacion 2</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="assets/css/bootstrap.min.css" rel="stylesheet"> 
        <link href="assets/css/bootstrap-theme.min.css" rel="stylesheet">
    </head>
    
    <body>
       
        <div class='container'>
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="alert alert-danger">Usuario o contraseña incorrectos.</div>
                    <center><h1>Iniciar Sesion</h1></center>
                    <hr>
                    
                    <form method="post" action="verifyLogin">
                        <div class="form-group">
                            <caption>Nombre de Usuario</caption>
                            <input type="text" name="username" class="form-control" >
                        </div>
                        
                        <div class="form-group">
                            <caption>Contraseña</caption>
                            <input type="password" name="password" class="form-control" >
                        </div>
                        
                        <div class="form-group">
                            <input type="submit" value="Entrar" class="btn btn-success btn-block" >
                        </div>
                        
                    </form>
                    
                </div>
            </div>
        </div>
        
        <script type="text/javascript" src="assets/js/jquery-2.2.4.min.js"></script>
        <script type="text/javascript" src="assets/bootstrap.min.js"></script>
        
    </body>

</html>