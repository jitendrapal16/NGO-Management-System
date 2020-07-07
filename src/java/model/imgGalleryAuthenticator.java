
package model;

import db.DBConnector;
import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

public class imgGalleryAuthenticator {
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
       imgGalleryAuthenticator.imgName=tv+fileExt;
       File newFile=new File(sr);
       oldFile.renameTo(newFile);
        }
       return sr;
    }
    
     public boolean isUpload(String imagePath,String eName) throws SQLException
    {
        long millis=System.currentTimeMillis();  
        java.sql.Date uDate=new java.sql.Date(millis);  
       
        Connection con=DBConnector.getConnection();
        String query="INSERT into imgGallery values(?,?,?,?)";
        PreparedStatement ps=con.prepareStatement(query);
        ps.setString(1,eName);
        ps.setString(2,imagePath);
        ps.setString(3,imgName);
        ps.setDate(4,uDate);
        int n=ps.executeUpdate();
        
        if(n>0){
            return true;
        }
        return false;
    }
    
}
