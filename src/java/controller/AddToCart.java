/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Product;

/**
 *
 * @author GanKPoet
 */
public class AddToCart extends HttpServlet {

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
            ProductDAO p = new ProductDAO();
            int productId = Integer.parseInt(request.getParameter("productId"));
            HttpSession ses = request.getSession();
            if (ses.getAttribute("account") == null) {
                request.setAttribute("notification", "You need to login for add to cart !");
                request.getRequestDispatcher("home").forward(request, response);
            } else {
                Map<Integer, Cart> carts = (Map<Integer, Cart>) ses.getAttribute("carts");
                if (carts == null) {
                    carts = new LinkedHashMap<>();
                }
                //lay product theo id
                if (carts.containsKey(productId)) {//sp da co trog gio hang
                    int oldQuantity = carts.get(productId).getQuantity();
                    carts.get(productId).setQuantity(oldQuantity + 1);
                } else {
                    Product product = p.getProductById(productId);
                    carts.put(productId, Cart.builder().product(product).quantity(1).build());
                }
                ses.setAttribute("carts", carts);
                String urlBack = (String) ses.getAttribute("BackUrl");
                if (urlBack == null) {
                    urlBack = "home";
                }
                response.sendRedirect(urlBack);
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
