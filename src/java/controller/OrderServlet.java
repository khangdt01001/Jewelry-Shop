/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.OderDAO;
import dal.OrderDetailDAO;
import dal.ShippingDAO;
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
import model.Order;
import model.Shipping;

/**
 *
 * @author GanKPoet
 */
public class OrderServlet extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession ses = request.getSession();
            Map<Integer, Cart> carts = (Map<Integer, Cart>) ses.getAttribute("carts");
            if (carts == null) {
                carts = new LinkedHashMap<>();
            }

            double total = 0;
            for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
                Integer key = entry.getKey();
                Cart value = entry.getValue();
                total += value.getQuantity() * value.getProduct().getPrice();
            }

            request.setAttribute("total", total);
            request.setAttribute("cartss", carts);

            request.getRequestDispatcher("order.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String note = request.getParameter("note");

        ShippingDAO sd = new ShippingDAO();
        OderDAO od = new OderDAO();
        OrderDetailDAO odd =new OrderDetailDAO();
        
        Shipping ship = Shipping.builder()
                .name(name)
                .phone(phone)
                .address(address)
                .build();
        int shippingId = sd.createReturnId(ship);
        
        HttpSession ses = request.getSession();
        Map<Integer, Cart> carts = (Map<Integer, Cart>) ses.getAttribute("carts");
        if (carts == null) {
            carts = new LinkedHashMap<>();
        }

        double total = 0;
        for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
            Integer key = entry.getKey();
            Cart value = entry.getValue();
            total += value.getQuantity() * value.getProduct().getPrice();
        }
        
        Order order = Order.builder()
                .accountId(1)
                .totalPrice(shippingId)
                .totalPrice(total)
                .note(note)
                .shippingId(shippingId)
                .build();
        int OrderId = od.createReturnId(order);
        
        odd.saveCart(OrderId,carts);
        
        ses.removeAttribute("carts");
        response.sendRedirect("thanks");
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
