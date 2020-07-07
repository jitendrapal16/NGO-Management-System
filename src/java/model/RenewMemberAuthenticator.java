
package model;

import db.DBConnector;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Calendar;


public class RenewMemberAuthenticator {
 
    public boolean isMember(String charge,String username) throws SQLException
    {   
        Statement st=DBConnector.getStatement();
        ResultSet rs=st.executeQuery("SELECT charge,expiryDate from membership where username='"+username+"'");
        String charge1=null;
        String dd=null;
        if(rs.next()){
            charge1=rs.getString(1);
            dd=rs.getString(2);
        }
        Date dDate=Date.valueOf(dd);
    
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
        int charg=Integer.parseInt(charge)+Integer.parseInt(charge1);
        
     
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
        String query="UPDATE membership Set charge='"+Integer.toString(charg)+"',expiryDate='"+eDate+"',duration='"+membership+"' where username='"+username+"'";
        int n=st.executeUpdate(query);
        if(n>0){
            return true;
        }
        return false;
    }   
}
