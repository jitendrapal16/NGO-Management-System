
package model;

import db.DBConnector;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class UserUpdateAuthenticator {
    public boolean isUpdate(String fname,String lname,String postalCode,String email,String phone,String address,String city,String country,String bio,String username,String username1) throws SQLException
       {
           //ResultSet rs=null;
          //String tablepassword="";
        Statement st=DBConnector.getStatement();
        Connection con=DBConnector.getConnection();
        String query = "UPDATE userinfo SET fname=?,lname=?,postalCode=?,email=?,phone=?,address=?,city=?,country=?,bio=?,username=? where username='"+username+"'";
        PreparedStatement ps=con.prepareStatement(query);
        ps.setString(1, fname);
        ps.setString(2, lname);
        ps.setString(3, postalCode);
        ps.setString(4, email);
        ps.setString(5, phone);
        ps.setString(6, address);
        ps.setString(7, city);
        ps.setString(8, country);
        ps.setString(9, bio);
        ps.setString(10, username1);
        //int i=st.executeUpdate(query);
        int i=ps.executeUpdate();
        String query1="UPDATE timeline SET username='"+username1+"'";
        if(i>0)
        {
            return true;
            
        }
        return false;
       }
}
