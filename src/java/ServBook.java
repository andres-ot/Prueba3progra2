import controller.Book;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServBook extends HttpServlet {

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
                Book bk = new Book();
            
            
            
            if (request.getParameter("delete") != null) {
                int eliminar_id = Integer.parseInt(request.getParameter("delete"));
                bk.setBook_id(eliminar_id);
                bk.delElement();
                response.sendRedirect("views/books/index.jsp");

            } else if (request.getParameter("edit") != null) {
               
               
                int id = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("name");
                String pdate = request.getParameter("publish_date");
                String isbn = request.getParameter("isbn");
                int author_id = Integer.parseInt(request.getParameter("author_id"));
                int pages = Integer.parseInt(request.getParameter("pages"));
                int createdBy = Integer.parseInt(request.getParameter("created_by"));
                
                bk.setBook_id(id);
                bk.setAuth_id(author_id);
                bk.setCreated_by(createdBy);
                bk.setIsbn(isbn);
                bk.setPublish_date(pdate);
                bk.setName(name);
                bk.setPages(pages);
                
                bk.updElement();
                
                response.sendRedirect("views/books/index.jsp");
            }
            else {
                
                String name = request.getParameter("name");
                String pdate = request.getParameter("pdate");
                String isbn = request.getParameter("isbn");
                int author_id = Integer.parseInt(request.getParameter("author_id"));
                int pages = Integer.parseInt(request.getParameter("pages"));
                int createdBy = Integer.parseInt(request.getParameter("created_by"));
                    
                bk.setAuth_id(author_id);
                bk.setCreated_by(1);
                bk.setIsbn(isbn);
                bk.setPublish_date(pdate);
                bk.setName(name);
                bk.setPages(pages);
              
                bk.newElement();
                
                response.sendRedirect("views/books/index.jsp");

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
