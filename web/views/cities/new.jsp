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
            <li><a href="../countries/index.jsp">Paises</a></li>
            <li><a href="index.jsp">Ciudades</a></li>
            
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
        </div>
        <br><br><br>
        <div class="container">
        
        <div class="row">
          
            <div class="col-md-4 col-md-push-4">
                <h1>Agregar Ciudad</h1>
                <hr/>
                <form action="../../ServCity" method="post">
                    
                    <div class="form-group">
                        <caption>Nombre</caption>
                        <input type="text" name="citname" class="form-control" >
                    </div>
                    
                    <div class="form-group">
                        <caption>Pais</caption>
                        <select id="pais" name="countid" class="form-control">
                            <option>Seleccione un pais...</option>
                        </select>
                    </div>


                    <div class="form-group">
                        <input type="submit" value="Crear" class="btn btn-block btn-success" > 
                    </div>
                </form>
            </div>
        </div>
    </div>
        
        <script   src="https://code.jquery.com/jquery-1.12.4.min.js"   integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="   crossorigin="anonymous"></script>
        <script type="text/javascript" src="assets/bootstrap.min.js"></script>
        
        <script type="text/javascript">
            $(function () {
                $.get('/Prueba3progra2/api?modulo=paises', function (data) {
                    $.each(data, function (i, v) {
                        $("#pais").append("<option value='" + v.country_id + "'>" + v.name + "</option>");
                    });
                });
            });
        </script>
    </body>
</html>
