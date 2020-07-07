
package model;

import db.DBConnector;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class mediaAuthenticator {
    
    public boolean isPublished(String title ,String description ,String type,String dop) throws SQLException, ParseException
       {
           //ResultSet rs=null;
          //String tablepassword="";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date d=(Date)sdf.parse(dop);//parse the String date into Date date
        java.sql.Date pDate = new java.sql.Date(d.getTime());
        //
        SimpleDateFormat month_date = new SimpleDateFormat("MMM yyyy", Locale.ENGLISH);
        //SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
        //String actualDate = "2016-03-20";
        Date date = sdf.parse(dop);
        String month_name = month_date.format(date);

        int pos = dop.lastIndexOf("-");
        if (pos > 0 && pos < (dop.length() - 1)) { // If '.' is not the first or last character.
        dop=dop.substring(pos+1, dop.length());
        }
        Connection con=DBConnector.getConnection();
        String query = "INSERT INTO media VALUES(?,?,?,?,?,?)";
        PreparedStatement ps=con.prepareStatement(query);
        ps.setString(1, title);
        ps.setString(2, description);
        ps.setString(3, type);
        ps.setDate(4, pDate);
        ps.setString(5, month_name);
        ps.setInt(6, Integer.parseInt(dop));
        //int i=st.executeUpdate(query);
        int i=ps.executeUpdate();
        if(i>0)
        {
            return true;
            
        }
        return false;
       }
}
