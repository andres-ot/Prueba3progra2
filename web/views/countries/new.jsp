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
    <body>
        <div>
            
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="../../main.html">Menu Principal</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="../users/index.jsp">Usuarios</a></li>
            <li><a href="../books/index.jsp">Libros</a></li>
            <li><a href="../authors/index.jsp">Autores</a></li>
            <li><a href="../nationalities/index.jsp">Nacionalidades</a></li>
            <li><a href="index.jsp">Paises</a></li>
            <li><a href="../cities/index.jsp">Ciudades</a></li>
            
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
        </div>
        <br><br><br>
        <div class="container">
        
        <div class="row">
            
            <div class="col-md-4 col-md-push-4">
                <h1>Agregar pais</h1>
                <hr/>
                <form action="../../ServCountr" method="post">
                    <div class="form-group">
                         <caption>Nombre</caption>
                         <input type="text" name="cname" class="form-control" >
                         <input type="hidden" name="createdby" class="form-control" value="<%out.println(session.getAttribute("user_id"));%>">
                         
                             
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
