/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import controller.City;
import controller.Country;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author fabian
 */
public class Api extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            
            ArrayList lista = new ArrayList();
            String modulo = request.getParameter("modulo");
            String idCiudad = request.getParameter("id_ciudad");
            String idPais = request.getParameter("id_pais");
            
            Country pais = new Country();
            // Paises
            
            if ( modulo.equals("paises") ) {    
                
                ResultSet fila = pais.showAll();
                try {

                   while ( fila.next() ) {
                       Country country = new Country();
                       country.setName(fila.getString("name"));
                       country.setCountry_id(fila.getInt("country_id"));

                       lista.add(country);
                   } 

                } catch ( Exception ex ) {

                }
            }
            
            
            // Ciudades
            
            if ( modulo.equals("ciudades") ) {
                
                if ( idCiudad != null ) {
                    // devolvemos la ciudad con el id ciudad
                    City ciudad = new City();
                    ciudad.setCity_id(Integer.parseInt(idCiudad));
                    ResultSet fila = ciudad.getOne();
                    
                    try {

                       while ( fila.next() ) {
                           City c = new City();
                           c.setName(fila.getString("name"));
                           c.setCity_id(fila.getInt("city_id"));
                           c.setCountry_id(fila.getInt("country_id"));
                           c.setState(fila.getInt("state"));

                           lista.add(c);
                       } 

                    } catch ( Exception ex ) {

                    }
                    
                }
                
                else if ( idPais != null ) {
                    // devolvemos las ciudades con el pais al que pertenece
                    City ciudad = new City();
                    ResultSet fila = ciudad.showAllFrom(Integer.parseInt(idPais));
                    try {

                       while ( fila.next() ) {
                           City c = new City();
                           c.setName(fila.getString("name"));
                           c.setCity_id(fila.getInt("city_id"));
                           c.setCountry_id(fila.getInt("country_id"));
                           c.setState(fila.getInt("state"));

                           lista.add(c);
                       } 

                    } catch ( Exception ex ) {

                    }
                }
                
                else {
                    City ciudad = new City();
                    ResultSet fila = ciudad.showAll();
                    try {

                       while ( fila.next() ) {
                           City c = new City();
                           c.setName(fila.getString("name"));
                           c.setCity_id(fila.getInt("city_id"));
                           c.setCountry_id(fila.getInt("country_id"));
                           c.setState(fila.getInt("state"));
                           lista.add(c);
                       } 

                    } catch ( Exception ex ) {

                    }
                }
            }
            
            Gson gson = new GsonBuilder().setPrettyPrinting().create();
            String json = gson.toJson(lista);
            response.setContentType("application/json;charset=UTF-8");
            out.write(json);
     
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
