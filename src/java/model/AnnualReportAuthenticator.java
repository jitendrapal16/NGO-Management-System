
package model;

import db.DBConnector;
import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;


public class AnnualReportAuthenticator {
    public static String actualPath;
    public boolean isAnnualReport(String annualreport,String year) throws SQLException
    {
        long millis=System.currentTimeMillis();  
        java.sql.Date cDate=new java.sql.Date(millis);
        Connection con=DBConnector.getConnection();
        String query="INSERT into annualreport values(?,?,?,?)";
        PreparedStatement ps=con.prepareStatement(query);
        ps.setString(1,annualreport);
        ps.setDate(2,cDate);
        ps.setString(3, actualPath);
        ps.setInt(4, Integer.parseInt(year));
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
       actualPath=tv+fileExt;
       File newFile=new File(sr);
       oldFile.renameTo(newFile);
        }
       return sr;
    }
}
