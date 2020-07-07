package model;

import db.DBConnector;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;



public class RegAuthenticator 
{
    public boolean isRegister(String fname,String lname,String dob,String email,String phone,String address,String profession,String nationality,String gender,String username,String password) throws SQLException, ParseException
       {
           //ResultSet rs=null;
          //String tablepassword="";
        Statement st=DBConnector.getStatement();
        Connection con=DBConnector.getConnection();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date det=(Date)sdf.parse(dob);
        java.sql.Date sDate = new java.sql.Date(det.getTime());
        long millis=System.currentTimeMillis();  
        java.sql.Date doj=new java.sql.Date(millis);  
        String query = "INSERT INTO userinfo VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps=con.prepareStatement(query);
        ps.setString(1, fname);
        ps.setString(2, lname);
        ps.setString(3, username);
        ps.setString(4, password);
        ps.setDate(6, sDate);
        ps.setString(7, gender);
        ps.setString(8, email);
        ps.setString(9, phone);
        ps.setString(11, profession);
        ps.setString(10, nationality);
        ps.setString(20, address);
        ps.setString(5, "Volunteer");
        ps.setString(12, null);
        ps.setString(13, null);
        ps.setString(14, null);
        ps.setString(15, null);
        ps.setString(16, null);
        ps.setString(17, null);
        ps.setDate(18, doj);
        ps.setString(19, null);
        //int i=st.executeUpdate(query);
        int i=ps.executeUpdate();
        if(i>0)
        {
            return true;
            
        }
        return false;
       }
}
