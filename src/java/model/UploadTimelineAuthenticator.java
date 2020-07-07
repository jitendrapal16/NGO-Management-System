
package model;

import db.DBConnector;
import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class UploadTimelineAuthenticator {
    private static String imgName=null,videoName=null;
    public static String getSetImg(String paath,String name){
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
       UploadTimelineAuthenticator.imgName=tv+fileExt;
       File newFile=new File(sr);
       oldFile.renameTo(newFile);
        }
       return sr;
    }
    public static String getSetVideo(String paath,String name){
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
       UploadTimelineAuthenticator.videoName=tv+fileExt;
       File newFile=new File(sr);
       oldFile.renameTo(newFile);
        }
       return sr;
    }
    
    public boolean isUpload(String description,String imgPath, String videoPath,String username) throws SQLException
    {
        
        Connection con=DBConnector.getConnection();
        Statement st=DBConnector.getStatement();
        ResultSet rs=st.executeQuery("SELECT * FROM userinfo where username='"+username+"'");
        String fname=null;
        String lname=null;
        String profile=null;
        if(rs.next()){
            fname=rs.getString("fname");
            lname=rs.getString("lname");
            profile=rs.getString("profile");
        }
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        String query="INSERT into timeline(description,datetime,imgPath,imgName,videoPath,videoName,username,fname,lname,profile) values(?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps=con.prepareStatement(query);
        ps.setString(1,description);
        ps.setString(2,dtf.format(now));
        ps.setString(3,imgPath);
        ps.setString(4,imgName);
        ps.setString(5,videoPath);
        ps.setString(6,videoName);
        ps.setString(7, username);
        ps.setString(8, fname);
        ps.setString(9, lname);
        ps.setString(10, profile);
        int n=ps.executeUpdate();
        if(n>0){
            return true;
        }
        return false;
    }
}
