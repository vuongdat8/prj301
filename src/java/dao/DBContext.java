/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBContext {

     protected Connection connection;
    public DBContext()
    {
        try{
   String user = "sa";
            String pass = "123";
            String url = "jdbc:sqlserver://DESKTOP-MQRVOS5:1433;databaseName=CmsTeacher";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
            System.out.println("ok");
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void main(String[] args) {
        
        new DBContext();
    }
}
