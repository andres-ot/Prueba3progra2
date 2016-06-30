<!DOCTYPE html>

<%@page import="controller.Nationality"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
                            <li><a href="index.jsp">Nacionalidades</a></li>
                            <li><a href="../cities/index.jsp">Ciudades</a></li>
                            <li><a href="../countries/index.jsp">Paises</a></li>

                        </ul>
                    </div><!--/.nav-collapse -->
                </div>
            </nav>

        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>
                        <br><br>
                        Nacionalidades en el sistema


                    </h1>
                    <br>

                    <a href="/Prueba3progra2/views/nationalities/new.jsp" class="pull-right btn btn-success">Crear Nacionalidad</a>    
                    <form method="post" action="index.jsp" class="form-inline">
                        <div class="form-group">          
                            <input type="text" name="searchName" placeholder="Buscar por nombre..." class="form-control">
                        </div>
                        <button type="submit" class="btn btn-success">Buscar</button>
                    </form> 
                    <hr />

                </div>
                <br><br><br>
                <div class="col-md-12">

                    <table class="table table-striped table-bordered">
                        <thead>
                        <th>ID</th>
                        <th>Nombre</th>

                        <th>Acciones</th>
                        </thead>

                        <tbody>
                            <%
                                Nationality nat = new Nationality();
                                ResultSet filas;
                                String name = request.getParameter("searchName");

                                if (request.getParameter("searchName") != null) {
                                    if (request.getParameter("searchName").isEmpty()) {
                                        filas = nat.showAll();
                                    } else {

                                        nat.setName(name);
                                        filas = nat.showSearch();
                                    }
                                } else {
                                    filas = nat.showAll();
                                }

                                while (filas.next()) {
                                    out.println("<tr>");
                                    out.println("<td>" + filas.getString("nation_id") + "</td>");
                                    out.println("<td>" + filas.getString("name") + "</td>");

                                    out.println("<td>");
                                    out.println("<a href='../../ServNation?delete=" + filas.getString("nation_id") + "' class='btn btn-danger btn-xs'>Eliminar</a>");
                                    out.println("<a href='edit.jsp?edit=" + filas.getString("nation_id") + "' class='btn btn-primary btn-xs'>Editar</a>");
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