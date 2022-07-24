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
import model.Shipping;

/**
 *
 * @author GanKPoet
 */
public class ShippingDAO extends DBContext {

    public int createReturnId(Shipping ship) {
        String sql = "INSERT INTO [dbo].[Shipping]\n"
                + "           ([name]\n"
                + "           ,[phone]\n"
                + "           ,[address])\n"
                + "     VALUES\n"
                + "           (?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setString(1, ship.getName());
            st.setString(2, ship.getPhone());
            st.setString(3, ship.getAddress());
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
