
package model;

import db.DBConnector;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Checker {
    public String getProfile(String username) throws SQLException{
        String profile=null;
        Statement st=DBConnector.getStatement();
        String query="SELECT profile FROM userinfo WHERE username='"+username+"'";
        ResultSet rs=st.executeQuery(query);
        if(rs.next()){
            return rs.getString("profile");
        }
        System.out.println(rs.getString("profile"));
        return profile;
    }
    
}
