
package model;

import db.DBConnector;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;


public class SubscribeAuthenticator {
    
    public boolean isSubscribe(String email) throws SQLException
       {
           //ResultSet rs=null;
          //String tablepassword="";
        Statement st=DBConnector.getStatement();
        Connection con=DBConnector.getConnection();
  
        String query = "INSERT INTO subscriber VALUES(?)";
        PreparedStatement ps=con.prepareStatement(query);
        ps.setString(1, email);
       
        //int i=st.executeUpdate(query);
        int i=ps.executeUpdate();
        if(i>0)
        {
            return true;
            
        }
        return false;
       }
}
