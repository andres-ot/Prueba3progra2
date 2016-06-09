import controller.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServUser extends HttpServlet {

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
            User usr = new User();
            
            
            
            if (request.getParameter("delete") != null) {
                int eliminar_id = Integer.parseInt(request.getParameter("delete"));
                usr.setUser_id(eliminar_id);
                usr.delElement();
                response.sendRedirect("views/users/index.jsp");

            } else if (request.getParameter("edit") != null) {
               
               
                int id = Integer.parseInt(request.getParameter("id"));
                String username = request.getParameter("username");
                String bdate = request.getParameter("birth_date");
                String passwd = request.getParameter("password");
                usr.setUser(username);
                usr.setBirth_date(bdate);
                usr.setPassword(passwd);
                usr.setUser_id(id);
                usr.updElement();
                
                response.sendRedirect("views/users/index.jsp");
            }
            else {
                String username = request.getParameter("username");
                String bdate = request.getParameter("birth_date");
                String passwd = request.getParameter("password");
                usr.setUser(username);
                usr.setBirth_date(bdate);
                usr.setPassword(passwd);
                usr.newElement();

                
                response.sendRedirect("views/users/index.jsp");

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
