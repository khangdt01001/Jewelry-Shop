/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;
import model.Cart;

/**
 *
 * @author GanKPoet
 */
public class OrderDetailDAO extends DBContext {

    public void saveCart(int OrderId, Map<Integer, Cart> carts) {
        String sql = "INSERT INTO [dbo].[OrderDetail]\n"
                + "           ([order_id]\n"
                + "           ,[productName]\n"
                + "           ,[productImage]\n"
                + "           ,[productPrice]\n"
                + "           ,[quantity])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, OrderId);
            for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
                Integer prductId = entry.getKey();
                Cart cart = entry.getValue();
                st.setString(2, cart.getProduct().getName());
                st.setString(3, cart.getProduct().getImageUrl());
                st.setDouble(4, cart.getProduct().getPrice());
                st.setDouble(5, cart.getQuantity());
                st.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
