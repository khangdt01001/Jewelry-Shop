/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;

public class CategoryDAO extends DBContext{

    public List<Category> getAllCategory(){
        List<Category> listCategory=new ArrayList<>();
        String sql = "select * from Category";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
//                Category c = new Category(rs.getInt("id"),
//                        rs.getString("name")
//                );
                   Category c =Category.builder()
                           .id(rs.getInt("id"))
                           .name(rs.getString("name"))
                           .build();
                listCategory.add(c);
            }
        } catch (SQLException e) {
        }
        return listCategory;
    }
}
