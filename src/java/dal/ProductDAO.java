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
import model.Product;

/**
 *
 * @author GanKPoet
 */
public class ProductDAO extends DBContext {

    public List<Product> getAllProduct() {
        List<Product> listProduct = new ArrayList<>();
        String sql = "select * from Product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = Product.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .quantity(rs.getInt(3))
                        .price(rs.getDouble(4))
                        .describe(rs.getString(5))
                        .imageUrl(rs.getString(6))
                        .createdDate(rs.getString(7))
                        .categoryId(rs.getInt(8))
                        .build();
                listProduct.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listProduct;
    }

    public List<Product> getProductByCategoryId(int categoryId) {
        List<Product> listProduct = new ArrayList<>();
        String sql = "select * from Product where Product.categoryId=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = Product.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .quantity(rs.getInt(3))
                        .price(rs.getDouble(4))
                        .describe(rs.getString(5))
                        .imageUrl(rs.getString(6))
                        .createdDate(rs.getString(7))
                        .categoryId(rs.getInt(8))
                        .build();
                listProduct.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listProduct;
    }

    public List<Product> getProductWithPage(int page, int page_size) {
        List<Product> listProduct = new ArrayList<>();
        String sql = "select * from Product order by id offset (?-1)*? row fetch next ? rows only";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, page);
            st.setInt(2, page_size);
            st.setInt(3, page_size);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = Product.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .quantity(rs.getInt(3))
                        .price(rs.getDouble(4))
                        .describe(rs.getString(5))
                        .imageUrl(rs.getString(6))
                        .createdDate(rs.getString(7))
                        .categoryId(rs.getInt(8))
                        .build();
                listProduct.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listProduct;
    }

    public List<Product> getProductWithPageByCategoryId(int page, int page_size, int categoryId) {
        List<Product> listProduct = new ArrayList<>();
        String sql = "select * from Product where categoryId = ? order by id offset (?-1)*? row fetch next ? rows only";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryId);
            st.setInt(2, page);
            st.setInt(3, page_size);
            st.setInt(4, page_size);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = Product.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .quantity(rs.getInt(3))
                        .price(rs.getDouble(4))
                        .describe(rs.getString(5))
                        .imageUrl(rs.getString(6))
                        .createdDate(rs.getString(7))
                        .categoryId(rs.getInt(8))
                        .build();
                listProduct.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listProduct;
    }

    public int getTotalProduct() {
        String sql = "select count (*) from Product ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<Product> search(String keyword) {
        List<Product> listProduct = new ArrayList<>();
        String sql = "select * from Product where name like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + keyword + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = Product.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .quantity(rs.getInt(3))
                        .price(rs.getDouble(4))
                        .describe(rs.getString(5))
                        .imageUrl(rs.getString(6))
                        .createdDate(rs.getString(7))
                        .categoryId(rs.getInt(8))
                        .build();
                listProduct.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listProduct;
    }

    public List<Product> SearchWithPage(String keyword, int page, int page_size) {
        List<Product> listProduct = new ArrayList<>();
        String sql = "select * from Product where name like ? order by id offset (?-1)*? row fetch next ? rows only";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + keyword + "%");
            st.setInt(2, page);
            st.setInt(3, page_size);
            st.setInt(4, page_size);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = Product.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .quantity(rs.getInt(3))
                        .price(rs.getDouble(4))
                        .describe(rs.getString(5))
                        .imageUrl(rs.getString(6))
                        .createdDate(rs.getString(7))
                        .categoryId(rs.getInt(8))
                        .build();
                listProduct.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listProduct;
    }

    public Product getProductById(int productId) {
        String sql = "select * from Product where id= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = Product.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .quantity(rs.getInt(3))
                        .price(rs.getDouble(4))
                        .describe(rs.getString(5))
                        .imageUrl(rs.getString(6))
                        .createdDate(rs.getString(7))
                        .categoryId(rs.getInt(8))
                        .build();
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void editProductById(int id, String name, int quantity, double price, String imageUrl, int categoryId) {
        try {
            String sql = "UPDATE [dbo].[Product]\n"
                    + "   SET [name] = ?\n"
                    + "      ,[quantity] = ?\n"
                    + "      ,[price] = ?\n"
                    + "      ,[imageUrl] = ?\n"
                    + "      ,[categoryId] = ?\n"
                    + " WHERE id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setInt(2, quantity);
            st.setDouble(3, price);
            st.setString(4, imageUrl);
            st.setInt(5, categoryId);
            st.setInt(6, id);
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public void deleteProduct(int id) {
        try {
            String sql = "DELETE FROM [dbo].[Product]\n"
                    + "      WHERE id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public void addNewProduct(String name, int quantity, double price, String imageUrl, int categoryId) {
        try {
            String sql = "INSERT INTO [dbo].[Product]\n"
                    + "           ([name]\n"
                    + "           ,[quantity]\n"
                    + "           ,[price]\n"
                    + "           ,[imageUrl]\n"
                    + "           ,[categoryId])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setInt(2, quantity);
            st.setDouble(3, price);
            st.setString(4, imageUrl);
            st.setInt(5, categoryId);
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }
     public List<Product> getRelatedProduct(int cid,int id) {
        List<Product> listProduct = new ArrayList<>();
        String sql = "SELECT TOP 4 * FROM Product where categoryId = ? and id != ? ORDER BY NEWID()";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            st.setInt(2, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = Product.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .quantity(rs.getInt(3))
                        .price(rs.getDouble(4))
                        .describe(rs.getString(5))
                        .imageUrl(rs.getString(6))
                        .createdDate(rs.getString(7))
                        .categoryId(rs.getInt(8))
                        .build();
                listProduct.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listProduct;
    }

    public List<Product> getProductTop4Category(int productId, int categoryId) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP 4 * FROM Product where categoryId = ? and id != ?  ORDER BY NEWID()";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryId);
            st.setInt(2, productId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = Product.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .quantity(rs.getInt(3))
                        .price(rs.getInt(4))
                        .describe(rs.getString(5))
                        .imageUrl(rs.getString(6))
                        .createdDate(rs.getString(7))
                        .categoryId(rs.getInt(8))
                        .build();
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
