
package model;

import db.DBConnector;
import java.io.File;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;


public class ProfileUploadAuthenticator {
    private static String backImgName=null,profileImgName=null;
    public static String getSetImg1(String paath,String name){
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
       ProfileUploadAuthenticator.backImgName=tv+fileExt;
       File newFile=new File(sr);
       oldFile.renameTo(newFile);
        }
       return sr;
    }
    public static String getSetImg2(String paath,String name){
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
       ProfileUploadAuthenticator.profileImgName=tv+fileExt;
       File newFile=new File(sr);
       oldFile.renameTo(newFile);
        }
       return sr;
    }
    
    public boolean isUpload(String username) throws SQLException
    {
        
        Statement st=DBConnector.getStatement();
        String query="UPDATE userinfo SET profile='"+profileImgName+"',profileBg='"+backImgName+"' where username='"+username+"'";
        String query1="UPDATE timeline SET profile='"+profileImgName+"' where username='"+username+"'";
        st.executeUpdate(query1);
        int n=st.executeUpdate(query);
        if(n>0){
            return true;
        }
        return false;
    }
}
