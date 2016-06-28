/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author andres
 */
@WebServlet(urlPatterns = {"/SAuth"})
public class SAuth extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String modulo = request.getParameter("modulo");
            ArrayList lista = new ArrayList();
            
            if ( modulo.equals("responsables") ) {
                
                Responsable serv = new Responsable();
                ResultSet s = serv.getAll();

                try {
                    while( s.next() ) {
                        int unidad_id = Integer.parseInt(request.getParameter("unidad_id") );
                        if ( s.getInt("unidad_id") == unidad_id ){
                           Responsable arrSer = new Responsable();
                            arrSer.setResponsable_id(s.getInt("reponsable_id"));
                            arrSer.setUnidad_id(s.getInt("unidad_id"));
                            arrSer.setNombre(s.getString("nombre"));
                            arrSer.setEstado(s.getString("estado"));
                            lista.add(arrSer); 
                        }
                        
                    }
                } catch (SQLException ex) {
                    out.println(ex);
                }
            }
            
            if ( modulo.equals("unidades") ) {
                Unidad serv = new Unidad();
                ResultSet s = serv.getAll();

                try {
                    while( s.next() ) {
                        int servicio_id = Integer.parseInt(request.getParameter("servicio_id"));
                        if ( s.getInt("servicio_id") == servicio_id ) {
                            Unidad arrSer = new Unidad();
                            arrSer.setUnidad_id(s.getInt("unidad_id"));
                            arrSer.setNombre(s.getString("nombre"));
                            arrSer.setEstado(s.getString("estado"));
                            arrSer.setServicio_id(s.getInt("servicio_id"));
                            lista.add(arrSer);
                        }
                    }
                } catch (SQLException ex) {
                    out.println(ex);
                }
            }
            
            if ( modulo.equals("servicios") ) {
                Servicio serv = new Servicio();
                ResultSet s = serv.getAll();

                try {
                    while( s.next() ) {
                        Servicio arrSer = new Servicio();
                        arrSer.setServicio_id(s.getInt("servicio_id"));
                        arrSer.setNombre(s.getString("nombre"));
                        arrSer.setEstado(s.getString("estado"));
                        lista.add(arrSer);
                    }
                } catch (SQLException ex) {
                    out.println(ex);
                }
            }
            
            Gson gson = new GsonBuilder().setPrettyPrinting().create();
            String json = gson.toJson(lista);
            response.setContentType("application/json;charset=UTF-8");
            out.write(json);
        }
        
    
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
