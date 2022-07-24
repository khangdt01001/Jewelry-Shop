package controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Category;
import model.Product;

public class HomeServerlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        final int page_size = 9;

        CategoryDAO s = new CategoryDAO();
        ProductDAO p = new ProductDAO();

        List<Category> listCategory = s.getAllCategory();

        HttpSession session = request.getSession();
        session.setAttribute("listCategory", listCategory);

        int page = 1;
        String pagestr = request.getParameter("page");
        if (pagestr != null) {
            page = Integer.parseInt(pagestr);
        }

        List<Product> listProduct = p.getProductWithPage(page, page_size);
        int totalProduct = p.getTotalProduct();
        int totalPage = totalProduct / page_size;
        if (totalProduct % page_size != 0) {
            totalPage += 1;
        }
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("page", page);
        request.setAttribute("listProduct", listProduct);
        session.setAttribute("BackUrl", "home");
        request.getRequestDispatcher("home.jsp").forward(request, response);
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
