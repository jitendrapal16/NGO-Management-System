
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
public class DonateAuthenticator {

    public boolean isDonateIndian(String fullName,String email, String phone, String dob, String address,String city, String postalCode, String panNum, String country,String state, String type, String amount,String donorFrom) throws SQLException, ParseException
    {
        char type1=type.charAt(type.length()-1);
        String type2=type.replace(type1, ' ');
        type=type2.trim();
        int i=Integer.parseInt(String.valueOf(type1));
        String donateField=null;
        switch(i){
            case 1: donateField="Overall Goals";break;
            case 2: donateField="Education";break;
            case 3: donateField="Health";break;
            case 4: donateField="Disaster Relief";break;
            case 5: donateField="Livelihood";break;
            default:donateField=null; 
        }
        long millis=System.currentTimeMillis();  
        java.sql.Date cDate=new java.sql.Date(millis);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date d=(Date)sdf.parse(dob);//parse the String date into Date date
        java.sql.Date dDate = new java.sql.Date(d.getTime());
        Connection con=DBConnector.getConnection();
        String query="INSERT into donation values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps=con.prepareStatement(query);
        ps.setString(1,fullName);
        ps.setString(2,email);
        ps.setString(3,phone);
        ps.setDate(4,dDate);
        ps.setInt(5,Integer.parseInt(amount));
        ps.setString(6,type);
        ps.setString(7,donateField);
        ps.setString(8,panNum);
        ps.setString(9,postalCode);
        ps.setString(10,address);
        ps.setString(11,city);
        ps.setString(12,country);
        ps.setString(13,state);
        ps.setString(14,null);
        ps.setString(15,null);
        ps.setString(16,donorFrom);
        ps.setDate(17,cDate);
        int n=ps.executeUpdate();
        if(n>0){
            return true;
        }
        return false;
    }
    public boolean isDonateNRI(String fullName,String email, String phone, String dob, String address,String city, String postalCode, String passport, String country,String state, String type, String amount, String returnFill,String donorFrom) throws SQLException, ParseException
    {
        char type1=type.charAt(type.length()-1);
        String type2=type.replace(type1, ' ');
        type=type2.trim();
        int i=Integer.parseInt(String.valueOf(type1));
        String donateField=null;
        switch(i){
            case 1: donateField="Overall Goals";break;
            case 2: donateField="Education";break;
            case 3: donateField="Health";break;
            case 4: donateField="Disaster Relief";break;
            case 5: donateField="Livelihood";break;
            default:donateField=null; 
        }
        long millis=System.currentTimeMillis();  
        java.sql.Date cDate=new java.sql.Date(millis);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date d=(Date)sdf.parse(dob);//parse the String date into Date date
        java.sql.Date dDate = new java.sql.Date(d.getTime());
        Connection con=DBConnector.getConnection();
        String query="INSERT into donation values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps=con.prepareStatement(query);
        ps.setString(1,fullName);
        ps.setString(2,email);
        ps.setString(3,phone);
        ps.setDate(4,dDate);
        ps.setInt(5,Integer.parseInt(amount));
        ps.setString(6,type);
        ps.setString(7,donateField);
        ps.setString(8,null);
        ps.setString(9,postalCode);
        ps.setString(10,address);
        ps.setString(11,city);
        ps.setString(12,country);
        ps.setString(13,state);
        ps.setString(14,passport);
        ps.setString(15,returnFill);
        ps.setString(16,donorFrom);
        ps.setDate(17,cDate);
        int n=ps.executeUpdate();
        if(n>0){
            return true;
        }
        return false;
    }
    public boolean isDonateForeign(String fullName,String email, String phone, String dob, String address,String city, String postalCode, String passport, String country,String state, String type, String amount,String donorFrom) throws SQLException, ParseException
    {
        char type1=type.charAt(type.length()-1);
        String type2=type.replace(type1, ' ');
        type=type2.trim();
        int i=Integer.parseInt(String.valueOf(type1));
        String donateField=null;
        switch(i){
            case 1: donateField="Overall Goals";break;
            case 2: donateField="Education";break;
            case 3: donateField="Health";break;
            case 4: donateField="Disaster Relief";break;
            case 5: donateField="Livelihood";break;
            default:donateField=null; 
        }
        long millis=System.currentTimeMillis();  
        java.sql.Date cDate=new java.sql.Date(millis);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date d=(Date)sdf.parse(dob);//parse the String date into Date date
        java.sql.Date dDate = new java.sql.Date(d.getTime());
        Connection con=DBConnector.getConnection();
        String query="INSERT into donation values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps=con.prepareStatement(query);
        ps.setString(1,fullName);
        ps.setString(2,email);
        ps.setString(3,phone);
        ps.setDate(4,dDate);
        ps.setInt(5,Integer.parseInt(amount));
        ps.setString(6,type);
        ps.setString(7,donateField);
        ps.setString(8,null);
        ps.setString(9,postalCode);
        ps.setString(10,address);
        ps.setString(11,city);
        ps.setString(12,country);
        ps.setString(13,state);
        ps.setString(14,passport);
        ps.setString(15,null);
        ps.setString(16,donorFrom);
        ps.setDate(17,cDate);
        int n=ps.executeUpdate();
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

