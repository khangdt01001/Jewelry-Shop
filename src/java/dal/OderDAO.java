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
import model.Order;

/**
 *
 * @author GanKPoet
 */
public class OderDAO extends DBContext{

    public int createReturnId(Order order) {
        String sql = "INSERT INTO [dbo].[Orders]\n"
                + "           ([account_id]\n"
                + "           ,[totalPrice]\n"
                + "           ,[note]\n"
                + "           ,[shipping_id])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setInt(1, order.getAccountId());
            st.setDouble(2, order.getTotalPrice());
            st.setString(3, order.getNote());
            st.setInt(4, order.getShippingId());
            st.executeUpdate();

            ResultSet rs = st.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

}
