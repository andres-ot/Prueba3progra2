/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import controller.Author;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrador
 */
public class ServAuthor extends HttpServlet {

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
            Author auth = new Author();
            
            
            
            if (request.getParameter("delete") != null) {
                int eliminar_id = Integer.parseInt(request.getParameter("delete"));
                auth.setAuth_id(eliminar_id);
                auth.delElement();
                response.sendRedirect("views/authors/index.jsp");

            } else if (request.getParameter("edit") != null) {
               
               
                int id = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("name");
                String fname = request.getParameter("fname");
                String lname = request.getParameter("lname");
                String bdate = request.getParameter("birth_date");
                int nation_id = Integer.parseInt(request.getParameter("nation_id"));
                auth.setName(name);
                auth.setFname(fname);
                auth.setLname(lname);
                auth.setBirth_date(bdate);
                auth.setNat_id(nation_id);
                auth.setAuth_id(id);
                auth.updElement();
                
                response.sendRedirect("views/authors/index.jsp");
            }
            else {
                
                String name = request.getParameter("name");
                String fname = request.getParameter("fname");
                String lname = request.getParameter("lname");
                String bdate = request.getParameter("birth_date");
                int nation_id = Integer.parseInt(request.getParameter("nation_id"));
                auth.setName(name);
                auth.setFname(fname);
                auth.setLname(lname);
                auth.setBirth_date(bdate);
                auth.setNat_id(nation_id);
                auth.newElement();

                
                response.sendRedirect("views/authors/index.jsp");

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
