/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Account;

/**
 *
 * @author SHD
 */
public class AccountDAO extends DBContext {

    public void insertAccount(Account account) {
        try {
            PreparedStatement ps = connection.prepareStatement("INSERT INTO [Users]\n"
                    + "           ([username]\n"
                    + "           ,[password]\n"
                    + "           ,[mail]\n"
                    + "           ,[phone]\n"
                    + "           ,[address]\n"
                    + "           ,[role])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)");
            ps.setString(1, account.getUsername());
            ps.setString(2, account.getPassword());
            ps.setString(3, account.getMail());
            ps.setString(4, account.getPhone());
            ps.setString(5, account.getAddress());
            ps.setInt(6, 1);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public Account getAccount(String username,String password) {
        Account account = new Account();
        try {
            String sql = "select  * from Users where username = ? and password = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1,username);
            stm.setString(2,password);
            ResultSet rs = stm.executeQuery();
            
            while (rs.next()) {
                Account p = new Account(rs.getInt(1),rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6),rs.getInt(7));
                
                return p;
            }
        } catch (SQLException e) {
        }
        return null;
    }

}
