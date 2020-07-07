
package model;

import db.DBConnector;
import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author LENOVO
 */
public class DonateCampAuthenticator {
    
    public boolean isDonateIndian(String fullName,String email, String phone, String dob, String address,String city, String postalCode, String panNum, String country,String state, String donateField, String amount,String donorFrom,String name) throws SQLException, ParseException
    {
        long millis=System.currentTimeMillis();  
        java.sql.Date cDate=new java.sql.Date(millis);  
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date d=(Date)sdf.parse(dob);//parse the String date into Date date
        java.sql.Date dDate = new java.sql.Date(d.getTime());
        Connection con=DBConnector.getConnection();
        String query="INSERT into donateCampaigns values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps=con.prepareStatement(query);
        ps.setString(1,fullName);
        ps.setString(2,email);
        ps.setString(3,phone);
        ps.setDate(4,dDate);
        ps.setInt(5,Integer.parseInt(amount));
        ps.setString(6,donateField);
        ps.setString(7,panNum);
        ps.setString(8,postalCode);
        ps.setString(9,address);
        ps.setString(10,city);
        ps.setString(11,country);
        ps.setString(12,state);
        ps.setString(13,null);
        ps.setString(14,null);
        ps.setString(15,donorFrom);
        ps.setDate(16,cDate);
        ps.setString(17,name);
        int n=ps.executeUpdate();
         Statement st=DBConnector.getStatement();
           ResultSet rs=st.executeQuery("SELECT COUNT(*) FROM donateCampaigns WHERE campName='"+name+"'");
           
        String donors="";
        if(rs.next()){
            donors=rs.getString(1);
        }
        ResultSet rst=st.executeQuery("SELECT SUM(amount) FROM donateCampaigns WHERE campName='"+name+"'");
        String raisedAmt="";
        if(rst.next()){
            raisedAmt=rst.getString(1);
        }
        String query1="UPDATE campaigns SET donors="+Integer.parseInt(donors)+" where name='"+name+"'";
        String query2="UPDATE campaigns SET raisedAmt="+Integer.parseInt(raisedAmt)+" where name='"+name+"'";
        int nod=st.executeUpdate(query1);
        int nor=st.executeUpdate(query2);
        if(n>0){
            return true;
        }
        return false;
    }
    public boolean isDonateNRI(String fullName,String email, String phone, String dob, String address,String city, String postalCode, String passport, String country,String state, String donateField, String amount, String returnFill,String name) throws SQLException, ParseException
    {
        long millis=System.currentTimeMillis();  
        java.sql.Date cDate=new java.sql.Date(millis);  
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date d=(Date)sdf.parse(dob);//parse the String date into Date date
        java.sql.Date dDate = new java.sql.Date(d.getTime());
        Connection con=DBConnector.getConnection();
        String query="INSERT into donateCampaigns values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps=con.prepareStatement(query);
        ps.setString(1,fullName);
        ps.setString(2,email);
        ps.setString(3,phone);
        ps.setDate(4,dDate);
        ps.setInt(5,Integer.parseInt(amount));
        ps.setString(6,donateField);
        ps.setString(7,null);
        ps.setString(8,postalCode);
        ps.setString(9,address);
        ps.setString(10,city);
        ps.setString(11,country);
        ps.setString(12,state);
        ps.setString(13,passport);
        ps.setString(14,returnFill);
        ps.setString(15,"nri");
        ps.setDate(16, cDate);
        ps.setString(17,name);
        int n=ps.executeUpdate();
        Statement st=DBConnector.getStatement();
          ResultSet rs=st.executeQuery("SELECT COUNT(*) FROM donateCampaigns WHERE campName='"+name+"'");
           
        String donors="";
        if(rs.next()){
            donors=rs.getString(1);
        }
        ResultSet rst=st.executeQuery("SELECT SUM(amount) FROM donateCampaigns WHERE campName='"+name+"'");
        String raisedAmt="";
        if(rst.next()){
            raisedAmt=rst.getString(1);
        }
        
        String query1="UPDATE campaigns SET donors="+Integer.parseInt(donors)+" where name='"+name+"'";
        String query2="UPDATE campaigns SET raisedAmt="+Integer.parseInt(raisedAmt)+" where name='"+name+"'";
        int nod=st.executeUpdate(query1);
        int nor=st.executeUpdate(query2);
        if(n>0){
            return true;
        }
        return false;
    }
    public boolean isDonateForeign(String fullName,String email, String phone, String dob, String address,String city, String postalCode, String passport, String country,String state, String donateField, String amount,String name) throws SQLException, ParseException
    {
        long millis=System.currentTimeMillis();  
        java.sql.Date cDate=new java.sql.Date(millis);  
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date d=(Date)sdf.parse(dob);//parse the String date into Date date
        java.sql.Date dDate = new java.sql.Date(d.getTime());
        Connection con=DBConnector.getConnection();
        String query="INSERT into donateCampaigns values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps=con.prepareStatement(query);
        ps.setString(1,fullName);
        ps.setString(2,email);
        ps.setString(3,phone);
        ps.setDate(4,dDate);
        ps.setInt(5,Integer.parseInt(amount));
        ps.setString(6,donateField);
        ps.setString(7,null);
        ps.setString(8,postalCode);
        ps.setString(9,address);
        ps.setString(10,city);
        ps.setString(11,country);
        ps.setString(12,state);
        ps.setString(13,passport);
        ps.setString(14,null);
        ps.setString(15,"foreignNational");
        ps.setDate(16,cDate);
        ps.setString(17, name);
        int n=ps.executeUpdate();
         Statement st=DBConnector.getStatement();
          ResultSet rs=st.executeQuery("SELECT COUNT(*) FROM donateCampaigns WHERE campName='"+name+"'");
           
        String donors="";
        if(rs.next()){
            donors=rs.getString(1);
        }
        ResultSet rst=st.executeQuery("SELECT SUM(amount) FROM donateCampaigns WHERE campName='"+name+"'");
        String raisedAmt="";
        if(rst.next()){
            raisedAmt=rst.getString(1);
        }
        
        String query1="UPDATE campaigns SET donors="+Integer.parseInt(donors)+" where name='"+name+"'";
        String query2="UPDATE campaigns SET raisedAmt="+Integer.parseInt(raisedAmt)+" where name='"+name+"'";
        int nod=st.executeUpdate(query1);
        int nor=st.executeUpdate(query2);
        if(n>0){
            return true;
        }
        return false;
    }
    public static String getSet(String paath,String name){
        String path=paath.replace("\\", "/");
        File oldFile=new File(path+"/"+name);
        Timestamp t=new Timestamp(System.currentTimeMillis());
        String ts=t.toString();
        String fileExt=null;
        String sr=null;
        String tv=ts.replace(":", "");
       int pos = name.lastIndexOf(".");
       if (pos > 0 && pos < (name.length() - 1)) { // If '.' is not the first or last character.
       fileExt=name.substring(pos, name.length());
       name = name.substring(0, pos);
       sr=path+"/"+tv+fileExt;
       File newFile=new File(sr);
       oldFile.renameTo(newFile);
        }
       return sr;
    }
    
}
