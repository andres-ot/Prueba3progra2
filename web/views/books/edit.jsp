<%-- 
    Document   : newuser
    Created on : 7/06/2016, 01:24:00 AM
    Author     : andres
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="controller.Book"%>
<%@page import="controller.Author"%>


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
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </nav>

        <div class="container">

            <div class="row">

                <div class="col-md-4 col-md-push-4">
                    <h1>Editar Autor</h1>
                    <hr/>
                    <%
                        int id = Integer.parseInt(request.getParameter("edit"));
                        Book bk = new Book();
                        bk.setBook_id(id);
                        ResultSet filas = bk.showEdit();
                        
                    %>
                    <form action="../../ServBook?edit=yes" method="post">
                        <div class="form-group">
                            <% while (filas.next()) {  %>
                            <div>
                                <caption>ID</caption>
                                <input type="text" readonly="true" value='<% out.println("" + filas.getString("book_id")); %>' name="id" class="form-control">
                            </div>

                            <caption>Nombre</caption>
                            <input type="text" name="name" value='<% out.println("" + filas.getString("name")); %>' class="form-control" >
                        </div>

                        <div class="form-group">
                            <caption>ISBN</caption>
                            <input type="text" name="isbn" value='<% out.println("" + filas.getString("isbn")); %>' class="form-control" >
                        </div>

                        <div class="form-group">
                            <caption>Paginas</caption>
                            <input type="text" name="pages" value='<% out.println("" + filas.getString("pages")); %>' class="form-control" >
                        </div>

                        <div class="form-group">
                            <caption> Fecha de Publicacion </caption>
                            <input type="text" name="pdate" id="datepicker" value='<% out.println("" + filas.getString("publish_date")); %>' class="form-control" >
                        </div>

                        <div class="form-group">
                            <caption>Autor</caption>
                            <select name="author_id" class="form-control">
                                <%
                                    Author a = new Author();
                                    ResultSet auth = a.showAll();
                                    while (auth.next()) {
                                        if ( filas.getString("author_id").equals(auth.getString("author_id") ) ){
                                            out.println("<option selected value=" + auth.getString("author_id") + ">" + auth.getNString("name") + "</option>");

                                        }else {
                                            out.println("<option value=" + auth.getString("author_id") + ">" + auth.getNString("name") + "</option>");
                                        }
                                    }
                                %>

                            </select>
                        </div>
                                
                        <div class="form-group">
                            <caption> Agregado por </caption>
                            <input type="text" readonly="true" name="created_by"  value='<% filas.getString("user"); %>' class="form-control" >
                        </div>

                        <div class="form-group">
                            <input type="submit" value="Editar" class="btn btn-block btn-success" > 
                        </div>
                        <% }%>
                    </form>
                </div>
            </div>
        </div>

        <script type="text/javascript" src="/Prueba3progra2/assets/js/jquery-2.2.4.min.js"></script>
        <script type="text/javascript" src="/Prueba3progra2/assets/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="/Prueba3progra2/assets/js/moment-with-locales.min.js"></script>
        <script type="text/javascript" src="/Prueba3progra2/assets/js/bootstrap-datetimepicker.min.js"></script>

        <script type="text/javascript">
            $(function () {
                $('#datetimepicker1').datetimepicker({
                    locale: 'es',
                    format: 'YYYY-MM-DD'
                });
            });
        </script>
        
    </body>
</html>
