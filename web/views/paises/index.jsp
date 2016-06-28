<%-- 
    Document   : listar
    Created on : 28-jun-2016, 4:01:39
    Author     : fabian
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="controller.Pais"%>
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
            <li><a href="index.jsp">Nacionalidades</a></li>
            
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
        
    <div class="container" style="padding-top: 60px">
        
        <div class="row">
            <div class="col-md-12">
                <h2>Paises en el sistema
                    <a href="crear.jsp" class="btn btn-success pull-right">Crear País</a> </h2>
                <hr>
            </div>
            
            <div class="col-md-12">
                <table class="table table-stripped table-bordered">
                    <thead>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Creado por</th>
                        <th>Acciones</th>
                    </thead>
                    <tbody>
                         <%
                                Pais nat = new Pais();
                                ResultSet filas = null;
                                String name = request.getParameter("searchName");

                                if (request.getParameter("searchName") != null) {
                                    if (request.getParameter("searchName").isEmpty()) {
                                        filas = nat.getAll();
                                    } else {
                                        
                                        nat.setNombre(name);
                                        //filas = nat.showSearch();
                                    }
                                } else {
                                    filas = nat.getAll();
                                }
                            
                                while (filas.next()) {
                                   
                                    out.println("<tr>");
                                    out.println("<td>" + filas.getString("pais_id") + "</td>");
                                    out.println("<td>" + filas.getString("nombre") + "</td>");
                                    out.println("<td>"+ filas.getString("creador")+"</td>");
                                    out.println("<td>");
                                    out.println("<a href='../../ServNation?delete=" + filas.getString("pais_id") + "' class='btn btn-danger btn-xs'>Eliminar</a>");
                                    out.println("<a href='edit.jsp?edit=" + filas.getString("pais_id") + "' class='btn btn-primary btn-xs'>Editar</a>");
                                    out.println("</td>");

                                    out.println("</tr>");
                                   
                                }
                            %>
                    </tbody>
                </table>
            </div>
            
        </div>
        
    </div>

        
        <script type="text/javascript" src="assets/js/jquery-2.2.4.min.js"></script>
        <script type="text/javascript" src="assets/bootstrap.min.js"></script>
    </body>
</html>
