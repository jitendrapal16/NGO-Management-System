package model;

import db.DBConnector;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class LoginAuthenticator 
{
    public boolean isLogin(String username,String password, String loginAs) throws SQLException
    {
        String tablepassword="";
        ResultSet rs=null;
        Statement st=DBConnector.getStatement();
        String query="select password from userinfo where username="+"'"+username+"'"+"AND role='"+loginAs+"'";
       /* if(username!="" && password!="")
        {*/
       rs=st.executeQuery(query);
       // }
       /* else
        {
            return false;
        }*/
        if(rs.next())
       {
        tablepassword=rs.getString(1);
       }
        
        if(username!=null && password!=null && password.equals(tablepassword))
        {
            return true;
        }
        return false;
    }
}
