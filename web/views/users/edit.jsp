<%-- 
    Document   : newuser
    Created on : 7/06/2016, 01:24:00 AM
    Author     : andres
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="controller.User"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <title>Prueba 3 Programacion 2</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="/Prueba3progra2/assets/css/bootstrap.min.css" rel="stylesheet"> 
        <link href="/Prueba3progra2/assets/css/bootstrap-theme.min.css" rel="stylesheet">        
        <link href="/Prueba3progra2/assets/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
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
                        <li><a href="../cities/index.jsp">Ciudades</a></li>
                        <li><a href="../countries/index.jsp">Paises</a></li>
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </nav>

        <div class="container">

            <div class="row">

                <div class="col-md-4 col-md-push-4">
                    <h1>Editar usuario</h1>
                    <hr/>
                    <%
                        int id = Integer.parseInt(request.getParameter("edit"));
                        User usr = new User();
                        usr.setUser_id(id);
                        ResultSet filas = usr.showEdit();
                        
                    %>
                    <form action="../../ServUser?edit=yes" method="post">
                        <div class="form-group">
                            <% while (filas.next()) {  %>
                            <div>
                                <caption>ID</caption>
                                <input type="text" readonly="true" value='<% out.println("" + filas.getString("user_id")); %>' name="id" class="form-control">
                            </div>

                            <caption>Usuario</caption>
                            <input type="text" name="username" value='<% out.println("" + filas.getString("user")); %>' class="form-control" >
                        </div>
                        
                        <div class="form-group">
                            <caption>Fecha de Nacimiento</caption>
                            <div class='input-group date' id='datetimepicker1'>
                                <input value='<% out.println("" + filas.getString("birth_date")); %>' type='text' class="form-control" name="birth_date" />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                                
                        <div class="form-group">
                            <caption>Pais</caption>
                            <select name="pais" class="form-control" id="pais">
                                
                            </select>
                        </div>
                        
                        <div class="form-group">
                            <caption>Ciudad</caption>
                            <select name="ciudad" class="form-control" id="ciudad" x-data-city-id="<% out.println("" + filas.getString("city_id")); %>">
                                
                            </select>
                        </div>
                                
                                

                        <div class="form-group">
                            <caption>Contraseña</caption>
                            <input type="text" name="password" value='<% out.println("" + filas.getString("password")); %>' class="form-control" >
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
            
            var ciudad = "";
            var idCiudad = $("#ciudad").attr('x-data-city-id');
            console.log(idCiudad);
            
            // pedir info de la ciudad
            $.get('/Prueba3progra2/api?modulo=ciudades&id_ciudad='+idCiudad, function(data){
                ciudad = data;
            }).done(function(data){
                city = data[0];
                $.get("/Prueba3progra2/api?modulo=paises", function (data) {
                    $.each(data, function (i, v) {
                        if ( v.country_id == city.country_id ) {
                            $("#pais").append("<option value='" + v.country_id + "' selected >" + v.name + "</option>")
                        } else {
                            $("#pais").append("<option value='" + v.country_id + "'>" + v.name + "</option>")
                        } 
                    });
                });
                
                $.get("/Prueba3progra2/api?modulo=ciudades&id_pais="+city.country_id, function(data){
                   $.each(data, function (i, v) {
                       if( city.city_id==v.city_id ) {
                            $("#ciudad").append("<option value='" + v.city_id + "' selected>" + v.name + "</option>");
                       } else {
                            $("#ciudad").append("<option value='" + v.city_id + "'>" + v.name + "</option>");

                       }
                    }); 
                });
            });
            
            $("#pais").change(function(){
               var idPais = $(this).val();
               $("#ciudad").empty();
               $.get("/Prueba3progra2/api?modulo=ciudades&id_pais="+idPais, function(data){
                   $.each(data, function (i, v) {
                        $("#ciudad").append("<option value='" + v.city_id + "'>" + v.name + "</option>");
                    }); 
               });
            });
 
            
        </script>
    </body>
</html>
