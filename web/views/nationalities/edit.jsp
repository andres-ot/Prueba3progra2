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
            <div class="container">

                <div class="row">
                    <br><br><br>
                    <div class="col-md-4 col-md-push-4">
                        <h1>Editar Nacion</h1>
                        <hr/>
                        <%
                            int id = Integer.parseInt(request.getParameter("edit"));
                            Connect con = new Connect();
                            con.setConsult("select * from nationalities where nation_id='" + id + "'");
                        %>
                        <form action="../../ServNation?edit=yes" method="post">
                            <div class="form-group">
                                <% while (con.getResult().next()) {  %>
                                <div>
                                    <caption>ID</caption>
                                    <input type="text" readonly="true" value='<% out.println("" + con.getResult().getString("nation_id")); %>' name="id" class="form-control">
                                </div>

                                <caption>Nombre</caption>
                                <input type="text" name="nationame" value='<% out.println("" + con.getResult().getString("name")); %>' class="form-control" >
                            </div>



                            <div class="form-group">
                                <input type="submit" value="Editar" class="btn btn-block btn-success" > 
                            </div>
                            <% }%>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <br><br><br>

        <script type="text/javascript" src="assets/js/jquery-2.2.4.min.js"></script>
        <script type="text/javascript" src="assets/bootstrap.min.js"></script>
    </body>
</html>