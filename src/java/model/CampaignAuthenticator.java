/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import db.DBConnector;
import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author LENOVO
 */
public class CampaignAuthenticator {
    private static String imgName;
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
       CampaignAuthenticator.imgName=tv+fileExt;
       File newFile=new File(sr);
       oldFile.renameTo(newFile);
        }
       return sr;
    }
    
    public boolean isRaised(String campName,String description, String type, String goalAmt, String imgLocalPath) throws SQLException, ParseException
    {
        
        long millis=System.currentTimeMillis();  
        java.sql.Date nowDate=new java.sql.Date(millis); 
        Connection con=DBConnector.getConnection();
        String query="INSERT into campaigns(name,description,type,goalAmt,imgLocalPath,raisedOn,imgName) values(?,?,?,?,?,?,?)";
        PreparedStatement ps=con.prepareStatement(query);
        ps.setString(1,campName);
        ps.setString(2,description);
        ps.setString(3,type);
        ps.setInt(4,Integer.parseInt(goalAmt));
        ps.setString(5,imgLocalPath);
        ps.setDate(6,nowDate);
        ps.setString(7,CampaignAuthenticator.imgName);
        int n=ps.executeUpdate();
        if(n>0){
            return true;
        }
        return false;
    }
}
