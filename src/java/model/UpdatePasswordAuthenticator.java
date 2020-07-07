
package model;

import db.DBConnector;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UpdatePasswordAuthenticator {
    public boolean isUpdate(String currentPassword,String newPassword,String username) throws SQLException
       {
           //ResultSet rs=null;
        String tablepassword="";
        Statement st=DBConnector.getStatement();
        String query="select password from userinfo where username="+"'"+username+"'";
        
        //int i=st.executeUpdate(query);
        
        
        ResultSet rs=st.executeQuery(query);
            if(rs.next())
            {
             tablepassword=rs.getString(1);
            }
        if(currentPassword.equals(tablepassword))
        {
            String query1="UPDATE userinfo SET password='"+newPassword+"' where username='"+username+"'";
            int n=st.executeUpdate(query1);
            if(n>0){
                return true;
            }
        }
        return false;
       }
}
