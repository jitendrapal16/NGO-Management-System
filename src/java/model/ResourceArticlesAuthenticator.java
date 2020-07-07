
package model;

import db.DBConnector;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ResourceArticlesAuthenticator {
    
    public boolean isPublished(String title ,String description ,String topic) throws SQLException
       {
           //ResultSet rs=null;
          //String tablepassword="";
       
        Connection con=DBConnector.getConnection();
        long millis=System.currentTimeMillis();  
        java.sql.Date cDate=new java.sql.Date(millis);  
        String query = "INSERT INTO articles VALUES(?,?,?,?)";
        PreparedStatement ps=con.prepareStatement(query);
        ps.setString(1, title);
        ps.setString(2, description);
        ps.setString(3, topic);
        ps.setDate(4, cDate);
        //int i=st.executeUpdate(query);
        int i=ps.executeUpdate();
        if(i>0)
        {
            return true;
            
        }
        return false;
       }
}
