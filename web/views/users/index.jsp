<%-- 
    Document   : newuser
    Created on : 7/06/2016, 01:24:00 AM
    Author     : andres
--%>

<%@page import="model.Connect"%>
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
          <a class="navbar-brand" href="../../main.html">Menu Principal</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="index.jsp">Usuarios</a></li>
            <li><a href="../books/index.jsp">Libros</a></li>
            <li><a href="../authors/index.jsp">Autores</a></li>
            <li><a href="../nationalities/index.jsp">Nacionalidades</a></li>
            
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
                <br>
                <br>
                        
                    <form method="post" action="index.jsp">
                        Buscar por Nombre:<input type="text" name="searchName" ><input type="submit" value="Buscar">
                    </form>
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
                    <%
                            Connect con = new Connect();
                            if (request.getParameter("searchName") != null) {
                                if (request.getParameter("searchName").isEmpty()) {
                                    con.setConsult("select * from users where state=1");
                                } else {

                                    String name = request.getParameter("searchName");
                                    con.setConsult("select * from users where user like '%" + name + "%' and state=1");
                                }
                            } else {
                                con.setConsult("select * from users where state=1");
                            }
                        %>
                        <%
                            //con.setConsulta("select Usuarios.usuario_id,Usuarios.nombre,Usuarios.apepat,Usuarios.apemat,Ciudades.nombre as ciudad from Usuarios,Ciudades where Usuarios.ciudad_id=Ciudades.ciudad_id and Usuarios.estado='Activo'");
                            while (con.getResult().next()) {
                                out.println("<tr>");
                                out.println("<td>" + con.getResult().getString("user_id") + "</td>");
                                out.println("<td>" + con.getResult().getString("user") + "</td>");
                                out.println("<td>" + con.getResult().getString("birth_date") + "</td>");
                                
                                out.println("<td>" + "<a href='../../ServUser?delete=" + con.getResult().getString("user_id") + "' class='btn btn-danger'>Eliminar</a>" + "</td>");
                                out.println("<td>" + "<a href='edit.jsp?edit=" + con.getResult().getString("user_id") + "' class='btn btn-primary'>Editar</a>" + "</td>");

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
