<%@page import="java.io.File"%>
<%@page import="model.Connect" %>
<%@page import="net.sf.jasperreports.engine.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reporte Lista Autores</title>
    </head>
    <body>
        <%
            try {
                Connect con = new Connect();
                File reportFile = new File(application.getRealPath("//views//reports//ReporteNat.jasper"));
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), null, con.getConnect());
                response.setContentType("application/pdf");
                response.setContentLength(bytes.length);
                ServletOutputStream outputStream=response.getOutputStream();
                outputStream.write(bytes,0,bytes.length);
                outputStream.flush();
                outputStream.close();
            } catch (Exception ex) {
                out.println("ERROR DE CONEXION AL GENERAR EL REPORTE! :D");
            }
        %>
    </body>
</html>
