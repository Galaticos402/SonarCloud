/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package category;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import utils.DbConnect;

/**
 *
 * @author dell
 */
public class CategoryDAO implements Serializable{
    private List<CategoryDTO> categoryList;
    
    public List<CategoryDTO> getCategoryList() {
        return categoryList;
    }
    
    public CategoryDTO getCategory(String categoryID)
        throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            con = new DbConnect().makeConnection();

            String sql = "Select Id, Name, Type "
                    + "From Category "
                    + "Where Id = ? ";

            stm = con.prepareStatement(sql);
            stm.setString(1, categoryID);

            rs = stm.executeQuery();

            if (rs.next()) {
                String id = rs.getString("Id");
                String name = rs.getString("Name");
                String type = rs.getString("Type");
                CategoryDTO c = new CategoryDTO(categoryID, name, type);

                return c;
            }
        } 
        finally {
            if (rs != null) {
                rs.close();
            }

            if (stm != null) {
                stm.close();
            }

            if (con != null) {
                con.close();
            }
        }
        
        return null;
    }
    
    public void getAllCategory()
        throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = new DbConnect().makeConnection();

            String sql = "Select Id, Name, Type "
                    + "From Category ";

            stm = con.prepareStatement(sql);

            rs = stm.executeQuery();

            while (rs.next()) {
                String id = rs.getString("Id");
                String name = rs.getString("Name");
                String type = rs.getString("Type");
                CategoryDTO dto = new CategoryDTO(id, name, type);

                if (this.categoryList == null) {
                    this.categoryList = new ArrayList<>();
                }

                this.categoryList.add(dto);
            }
        } finally {
            if (rs != null) {
                rs.close();
            }

            if (stm != null) {
                stm.close();
            }

            if (con != null) {
                con.close();
            }
        }
        
    }
    
    public List<CategoryDTO> getCakeCategory()
        throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = new DbConnect().makeConnection();

            String sql = "Select Id, Name, Type "
                    + "From Category "
                    + "Where Type = ?";

            stm = con.prepareStatement(sql);
            stm.setString(1, "cake");
            rs = stm.executeQuery();

            List<CategoryDTO> categoryCakeList = new ArrayList<>();
            
            while (rs.next()) {
                String id = rs.getString("Id");
                String name = rs.getString("Name");
                String type = rs.getString("Type");
                CategoryDTO dto = new CategoryDTO(id, name, type);

                categoryCakeList.add(dto);
            }
            
            return categoryCakeList;
        } finally {
            if (rs != null) {
                rs.close();
            }

            if (stm != null) {
                stm.close();
            }

            if (con != null) {
                con.close();
            }
        }
    }
}
