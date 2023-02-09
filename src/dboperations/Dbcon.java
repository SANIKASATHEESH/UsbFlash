/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dboperations;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author RISS
 */
public class Dbcon {
    Connection con=null;
    public Connection getcon() throws SQLException,ClassNotFoundException
    {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/usbchek","root","");
        return con;    
    }
}

