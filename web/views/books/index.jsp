<%-- 
    Document   : newuser
    Created on : 7/06/2016, 01:24:00 AM
    Author     : andres
--%>

<%@page import="controller.Book"%>


<%@page import="java.sql.ResultSet"%>

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
                        <li><a href="../users/index.jsp">Usuarios</a></li>
                        <li><a href="index.jsp">Libros</a></li>
                        <li><a href="../authors/index.jsp">Autores</a></li>
                        <li><a href="../nationalities/index.jsp">Nacionalidades</a></li>
                        <li><a href="../cities/index.jsp">Ciudades</a></li>
                        <li><a href="../countries/index.jsp">Paises</a></li>

                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </nav>

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>
                        Libros en el sistema
                       
                        <a href="/Prueba3progra2/views/books/new.jsp" class="pull-right btn btn-success">Crear Libro</a>
                    </h1>

                    <form method="post" action="index.jsp" class="form-inline">
                        <div class="form-group">          
                            <input type="text" name="searchName" placeholder="Buscar por nombre..." class="form-control">
                        </div>
                        <button type="submit" class="btn btn-success">Buscar</button>
                    </form> 



                    <hr />
                </div>

                <div class="col-md-12">

                    <table class="table table-striped table-bordered">
                        <thead>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>ISBN</th>
                        <th>Paginas</th>
                        <th>Autor</th>
                        <th>Fecha de publicacion</th>
                        <th>Agregado por</th>
                        <th>Acciones</th>
                        </thead>

                        <tbody>
                            <%
                                Book bk = new Book();
                                ResultSet filas;
                                String bks = request.getParameter("searchName");

                                if (request.getParameter("searchName") != null) {
                                    if (request.getParameter("searchName").isEmpty()) {
                                        filas = bk.showAll();
                                    } else {

                                        String name = request.getParameter("searchName");
                                        bk.setName(name);
                                        filas = bk.showSearch();
                                    }
                                } else {
                                    filas = bk.showAll();
                                }
                            %>
                            <%
                                while (filas.next()) {
                                    out.println("<tr>");
                                    out.println("<td>" + filas.getString("book_id") + "</td>");
                                    out.println("<td>" + filas.getString("name") + "</td>");
                                    out.println("<td>" + filas.getString("isbn") + "</td>");
                                    out.println("<td>" + filas.getString("pages") + "</td>");
                                    out.println("<td>" + filas.getString("auname") +" "+ filas.getString("auapepat")+" "+filas.getString("auapemat")+"</td>");
                                    out.println("<td>" + filas.getString("publish_date") + "</td>");
                                    out.println("<td>" + filas.getString("created_by") + "</td>");
                                    out.println("<td><a href='../../ServBook?delete=" + filas.getString("book_id") + "' class='btn btn-xs btn-danger'>Eliminar</a>");
                                    out.println("<a href='edit.jsp?edit=" + filas.getString("book_id") + "' class='btn btn-xs btn-primary'>Editar</a></td>");

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
