
package model;

import db.DBConnector;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ActivityAuthenticator {
    
    
    public boolean isActivity(String eventName,String location, String eventOn) throws SQLException, ParseException
    {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date d=(Date)sdf.parse(eventOn);//parse the String date into Date date
        java.sql.Date aDate = new java.sql.Date(d.getTime());
        Connection con=DBConnector.getConnection();
        String query="INSERT into activity values(?,?,?)";
        PreparedStatement ps=con.prepareStatement(query);
        ps.setString(1,eventName);
        ps.setString(2,location);
        ps.setDate(3,aDate);
        
        int n=ps.executeUpdate();
        if(n>0){
            return true;
        }
        return false;
    }
}
