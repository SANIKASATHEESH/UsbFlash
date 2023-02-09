/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dboperations;

import java.nio.file.Path;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class DbService {
    Connection con;
    Statement st;
    Statement st1;
    Statement st2;
    ResultSet rs,rs1;
    
    public DbService()
    {
        try {
            Dbcon db=new Dbcon();
            con=db.getcon();
            st=con.createStatement();
            st1=con.createStatement();
            st2=con.createStatement();
        } catch (Exception e) {
        }        
    }
    
    public int userLogin(String email, String pwd) {
        
        int i=0;
        
        try {
            rs=st.executeQuery("SELECT * FROM `users` WHERE email='"+email+"' AND PASSWORD='"+pwd+"' ");
            if(rs.next()){
                i=1;
            }
            else {
                i=0;
            }
        } 
        catch (Exception e) {
            System.out.println("ex--"+e.getMessage());
            i=0;
            return i;
        }
        return i;
    
    }
    
    public int addExtras(String drive, String s1, String tp, String cnserial_no, String totalSpace, String freeSpace)
    {
        int i=0;
        try {
            String str="INSERT INTO `newconnection` VALUES(NULL,'"+drive+"','"+s1+"','"+tp+"','"+cnserial_no+"','"+totalSpace+"','"+freeSpace+"',now(),now(),'connected')";
            System.out.println(str);
            i=st.executeUpdate(str);
        } 
        catch (Exception e) {
            System.out.println("ex--"+e.getMessage());
        }
        return i;
    }
    
    public int updateExtras(String drive)
    {
        int i=0;
        try {
            String str="update `newconnection` set status='disconnected',`rem_time`=now() where cn_drivename='"+drive+"' and status='connected'";
            System.out.println(str);
            i=st.executeUpdate(str);
        } 
        catch (Exception e) {
            System.out.println("ex--"+e.getMessage());
        }
        return i;
    }
    
    public ResultSet getNewConnections()
    {
        try 
        {
            rs=st.executeQuery("SELECT * FROM `newconnection` ORDER BY `cnid` DESC");
        } 
        catch (Exception e) {
        }
        return rs;
    }

    public int addFileActions(String dir, String fileact, Path fileName) {
        
        int i=0;
        
        try {
            rs=st.executeQuery("SELECT * FROM `filetransfer` WHERE `directory`='"+dir+"' AND `ftime`=now() AND `filename`='"+fileName+"' ");
            if(rs.next()){
                System.out.println("Already added");
            }
            else {
                String str="INSERT INTO `filetransfer` VALUES(NULL,'"+dir+"','"+fileact+"','"+fileName+"',now())";
                System.out.println(str);
                i=st1.executeUpdate(str);
            }
        } 
        catch (Exception e) {
            System.out.println("ex--"+e.getMessage());
        }
        return i;
    
    }
    
        
    public ResultSet viewFileActions(int id)
    {
        try 
        {
            rs=st2.executeQuery("SELECT * FROM `filetransfer`,`newconnection` WHERE `ftime` BETWEEN `con_time` AND `rem_time` AND cnid='"+id+"'");
        } 
        catch (Exception e) {
        }
        return rs;
    }

            
    public ResultSet viewFileActionsAll()
    {
        try 
        {
            rs=st2.executeQuery("SELECT * FROM `filetransfer` ORDER BY `fid` DESC");
        } 
        catch (Exception e) {
        }
        return rs;
    }

    public int addUser(String name, String email, String phone, String pwd) {
        int i=0;
        try 
        {
            rs=st.executeQuery("SELECT * FROM `users` WHERE `email`='"+email+"'");
            if(rs.next()){
                i=20;
                System.out.println("Mail ID Exists");
            }
            else {
                String str="INSERT INTO `users` VALUES(NULL,'"+name+"','"+email+"','"+phone+"','"+pwd+"')";
                System.out.println(str);
                i=st1.executeUpdate(str);
            }
        } 
        catch (Exception e) {
            System.out.println("ex--"+e.getMessage());
        }
        return i;
    }

    public int checkuser() {
        int i=0;
        try 
        {
            rs=st.executeQuery("SELECT * FROM `users`");
            if(rs.next()){
                i=1;                
            }
            else {
                i=0;
            }
        } 
        catch (Exception e) {
            System.out.println("ex--"+e.getMessage());
            i=0;
            return i;
        }
        return i;
    }

    
}
