
package model;

import db.DBConnector;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Calendar;

public class DonateMemberAuthenticator {
    
    
    public boolean isMember(String charge) throws SQLException
    {
        String membership=null;
        if(charge.equals("1000")){
            membership="1 Month";
        }
        else if(charge.equals("2850")){
            membership="3 Months";
        }
        else if(charge.equals("5700")){
            membership="6 Months";
        }
        else{
            membership="1 Year";
        }
        long millis=System.currentTimeMillis();  
        java.sql.Date cDate=new java.sql.Date(millis);
        java.sql.Date dDate=new java.sql.Date(millis);
        Calendar c = Calendar.getInstance();
       java.sql.Date eDate;
        if(membership=="1 Month"){
             c.setTime(dDate);
             c.add(Calendar.MONTH, 1);
             eDate=new java.sql.Date(c.getTimeInMillis());
        }
        else if(membership=="3 Months"){
             c.setTime(dDate);
             c.add(Calendar.MONTH, 3);
             eDate=new java.sql.Date(c.getTimeInMillis());
        }
        else if(membership=="6 Months"){
             c.setTime(dDate);
             c.add(Calendar.MONTH, 6);
             eDate=new java.sql.Date(c.getTimeInMillis());
        }
        else{
             c.setTime(dDate);
             c.add(Calendar.YEAR, 1);
             eDate=new java.sql.Date(c.getTimeInMillis());
        }
        Timestamp t=new Timestamp(System.currentTimeMillis());
        String ts=t.toString();
        Connection con=DBConnector.getConnection();
        String query="INSERT into membership values(?,?,?,?,?,?)";
        PreparedStatement ps=con.prepareStatement(query);
        ps.setString(1,null);
        ps.setInt(2,Integer.parseInt(charge));
        ps.setDate(3,cDate);
        ps.setDate(4,eDate);
        ps.setString(5, membership);
        ps.setString(6, ts);
        int n=ps.executeUpdate();
        if(n>0){
            return true;
        }
        return false;
    }
    
}
